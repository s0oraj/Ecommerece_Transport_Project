<?php
//'tes' => number_format(200 / 100, 2, ",", "."),
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/libraries/REST_Controller.php';
class Driverfilter extends REST_Controller
{

    public function __construct()
    {
        parent::__construct();

        $this->load->helper("url");
        $this->load->database();
        $this->load->model('Driver_model');
        $this->load->model('Customer_model');
        date_default_timezone_set(time_zone);
    }

    function index_get()
    {
        $this->response("Api for ouride!", 200);
    }

    function turning_on_post()
    {
        if (!isset($_SERVER['PHP_AUTH_USER'])) {
            header("WWW-Authenticate: Basic realm=\"Private Area\"");
            header("HTTP/1.0 401 Unauthorized");
            return false;
        }
        $data = file_get_contents("php://input");
        $dec_data = json_decode($data);

        $is_turn = $dec_data->is_turn;
        $dataEdit = array();
        if ($is_turn) {
            $dataEdit = array(
                'status' => 1
            );
            $upd_regid = $this->Driver_model->edit_config($dataEdit, $dec_data->id);
            if ($upd_regid) {
                $message = array(
                    'message' => 'success',
                    'data' => '1'
                );
                $this->response($message, 200);
            } else {
                $message = array(
                    'message' => 'fail',
                    'data' => []
                );
                $this->response($message, 200);
            }
        } else {
            $dataEdit = array(
                'status' => 4
            );
            $upd_regid = $this->Driver_model->edit_config($dataEdit, $dec_data->id);
            if ($upd_regid) {
                $message = array(
                    'message' => 'success',
                    'data' => '4'
                );
                $this->response($message, 200);
            } else {
                $message = array(
                    'message' => 'fail',
                    'data' => []
                );
                $this->response($message, 200);
            }
        }
    }

    function findpackage_post()
    {
        if (!isset($_SERVER['PHP_AUTH_USER'])) {
            header("WWW-Authenticate: Basic realm=\"Private Area\"");
            header("HTTP/1.0 401 Unauthorized");
            return false;
        }

        $data = file_get_contents("php://input");
        $dec_data = json_decode($data);

        $data_req = array(
            'agent_id' => $dec_data->agent_id,
            //'lat' => $dec_data->latitude,
            //'long' => $dec_data->longitude
        );
        $finish_transaksi = $this->Driver_model->order_filter_by_geo_new($data_req);
       
        if(empty($finish_transaksi)){
            $message = array(
            'status' => true,
            'data' => array());
             $this->response($message, 500);
        }

        $message = array(
            'status' => true,
            'count' => count($finish_transaksi),
            'data' => $finish_transaksi
        );
        $this->response($message, 200);
    }


    function nearestagent_post()
    {
        if (!isset($_SERVER['PHP_AUTH_USER'])) {
            header("WWW-Authenticate: Basic realm=\"Private Area\"");
            header("HTTP/1.0 401 Unauthorized");
            return false;
        }

        $data = file_get_contents("php://input");
        $dec_data = json_decode($data);

        $data_req = array(
            'lat' => $dec_data->latitude,
            'long' => $dec_data->longitude
        );
        $finish_transaksi = $this->Driver_model->agent_list_near_by_driver($data_req);
        if(empty($finish_transaksi)){
            $message = array(
            'status' => true,
            'data' => array());
             $this->response($message, 500);
        }
        $data = [];
        foreach ($finish_transaksi as $key => $value) {
            $agent_id = $value->id;
            $ag[] = $value->id;
            $total_order = $this->Driver_model->agents_order_count($agent_id);
            //if($total_order > 0) {
                $data[] = [
                    "id"=> $value->id,
                    "distance"=> $value->distance,
                    "agent2_latitude"=> $value->agent2_latitude,
                    "agent2_longitude"=> $value->agent2_longitude,
                    "agent2_address"=> $value->agent2_address,
                    "agent2_city"=> $value->agent2_city,
                    "agent2_state"=> $value->agent2_state,
                    "agent2_zipcode"=> $value->agent2_zipcode,
                    "agent2_phone_number"=> $value->agent2_phone_number,
                    "agent2_customer_fullname"=> $value->agent2_customer_fullname,
                    "orders" => $total_order
                ];
            //}
        }
        if(!empty($data)) {
            $message = array(
                'status' => true,
                'data' => $data
            );
            $this->response($message, 200);
        }
        $message = array(
            'status' => true,
            'data' => array());
            $this->response($message, 500);
    }
}
