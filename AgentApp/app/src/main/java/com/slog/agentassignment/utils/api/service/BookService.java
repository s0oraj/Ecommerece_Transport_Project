package com.slog.agentassignment.utils.api.service;

import com.slog.agentassignment.json.CheckStatusTransRequest;
import com.slog.agentassignment.json.CheckStatusTransResponse;
import com.slog.agentassignment.json.DetailRequestJson;
import com.slog.agentassignment.json.DetailTransResponseJson;
import com.slog.agentassignment.json.GetNearRideCarRequestJson;
import com.slog.agentassignment.json.GetNearRideCarResponseJson;
import com.slog.agentassignment.json.ItemRequestJson;
import com.slog.agentassignment.json.LocationDriverRequest;
import com.slog.agentassignment.json.LocationDriverResponse;
import com.slog.agentassignment.json.RideCarRequestJson;
import com.slog.agentassignment.json.RideCarResponseJson;
import com.slog.agentassignment.json.SendRequestJson;
import com.slog.agentassignment.json.SendResponseJson;
import com.slog.agentassignment.json.fcm.CancelBookRequestJson;
import com.slog.agentassignment.json.fcm.CancelBookResponseJson;


import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.POST;

/**
 * Created by Ourdevelops Team on 10/17/2019.
 */

public interface BookService {

    @POST("customerapi/list_ride")
    Call<GetNearRideCarResponseJson> getNearRide(@Body GetNearRideCarRequestJson param);

    @POST("customerapi/list_car")
    Call<GetNearRideCarResponseJson> getNearCar(@Body GetNearRideCarRequestJson param);

    @POST("customerapi/request_transaksi")
    Call<RideCarResponseJson> requestTransaksi(@Body RideCarRequestJson param);

    @POST("customerapi/inserttransaksimerchant")
    Call<RideCarResponseJson> requestTransaksiMerchant(@Body ItemRequestJson param);

    @POST("customerapi/request_transaksi_send")
    Call<SendResponseJson> requestTransaksisend(@Body SendRequestJson param);

    @POST("customerapi/check_status_transaksi")
    Call<CheckStatusTransResponse> checkStatusTransaksi(@Body CheckStatusTransRequest param);

    @POST("customerapi/user_cancel")
    Call<CancelBookResponseJson> cancelOrder(@Body CancelBookRequestJson param);

    @POST("customerapi/liat_lokasi_driver")
    Call<LocationDriverResponse> liatLokasiDriver(@Body LocationDriverRequest param);

    @POST("customerapi/detail_transaksi")
    Call<DetailTransResponseJson> detailtrans(@Body DetailRequestJson param);


}
