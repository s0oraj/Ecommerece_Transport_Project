package com.slog.driver.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;
import java.util.Date;

import io.realm.RealmObject;
import io.realm.annotations.PrimaryKey;

/**
 * Created by Ourdevelops Team on 10/19/2019.
 */

public class TransModel extends RealmObject implements Serializable{

    @PrimaryKey
    @Expose
    @SerializedName("id")
    private String id;

    @Expose
    @SerializedName("customer_id")
    private String idPelanggan;

    @Expose
    @SerializedName("driver_id")
    private String idDriver;

    @Expose
    @SerializedName("merchant_telephone_number")
    private String teleponmerchant;

    @Expose
    @SerializedName("service_order")
    private String orderFitur;

    @Expose
    @SerializedName("service")
    private String service;

    @Expose
    @SerializedName("start_latitude")
    private double startLatitude;

    @Expose
    @SerializedName("start_longitude")
    private double startLongitude;

    @Expose
    @SerializedName("end_latitude")
    private double endLatitude;

    @Expose
    @SerializedName("end_longitude")
    private double endLongitude;

    @Expose
    @SerializedName("distance")
    private double distance;

    @Expose
    @SerializedName("price")
    private long price;

    @Expose
    @SerializedName("order_time")
    private Date waktuOrder;

    @Expose
    @SerializedName("finish_time")
    private Date waktuSelesai;

    @Expose
    @SerializedName("pickup_address")
    private String alamatAsal;

    @Expose
    @SerializedName("destination_address")
    private String alamatTujuan;

    @Expose
    @SerializedName("agent1_latitude")
    private double agent1_latitude;

    @Expose
    @SerializedName("agent1_longitude")
    private double agent1_longitude;

    @Expose
    @SerializedName("agent1_address")
    private String agent1_address;

    @Expose
    @SerializedName("agent1_city")
    private String agent1_city;

    @Expose
    @SerializedName("agent1_state")
    private String agent1_state;

    @Expose
    @SerializedName("agent1_zipcode")
    private String agent1_zipcode;

    @Expose
    @SerializedName("agent1_phone_number")
    private String agent1_phone_number;

    @Expose
    @SerializedName("agent1_customer_fullname")
    private String agent1_customer_fullname;


    @Expose
    @SerializedName("agent2_latitude")
    private double agent2_latitude;

    @Expose
    @SerializedName("agent2_longitude")
    private double agent2_longitude;

    @Expose
    @SerializedName("agent2_address")
    private String agent2_address;

    @Expose
    @SerializedName("agent2_city")
    private String agent2_city;

    @Expose
    @SerializedName("agent2_state")
    private String agent2_state;

    @Expose
    @SerializedName("agent2_zipcode")
    private String agent2_zipcode;

    @Expose
    @SerializedName("agent2_phone_number")
    private String agent2_phone_number;

    @Expose
    @SerializedName("agent2_customer_fullname")
    private String agent2_customer_fullname;

    @Expose
    @SerializedName("promo_code")
    private String kodePromo;

    @Expose
    @SerializedName("promo_discount")
    private String kreditPromo;

    @Expose
    @SerializedName("wallet_payment")
    private boolean pakaiWallet;

    @Expose
    @SerializedName("rate")
    private String rate;

    @Expose
    @SerializedName("status")
    public int status;

    @Expose
    @SerializedName("estimate_time")
    private String estimasi;

    @Expose
    @SerializedName("sender_name")
    public String namaPengirim;

    @Expose
    @SerializedName("sender_phone")
    public String teleponPengirim;

    @Expose
    @SerializedName("receiver_name")
    public String namaPenerima;

    @Expose
    @SerializedName("receiver_phone")
    public String teleponPenerima;

    @Expose
    @SerializedName("goods_item")
    public String namaBarang;

    @Expose
    @SerializedName("final_cost")
    public String final_cost;

    @Expose
    @SerializedName("total_price")
    public String total_price;

    @Expose
    @SerializedName("merchant_name")
    public String merchant_name;

    @Expose
    @SerializedName("merchant_id")
    public String merchant_id;

    @Expose
    @SerializedName("merchant_token")
    public String merchant_token;

    @Expose
    @SerializedName("merchant_image")
    public String merchant_image;

    @Expose
    @SerializedName("merchant_transaction_id")
    public String idtransmerchant;

    @Expose
    @SerializedName("home")
    private String home;

    public double getAgent1_latitude() {
        return agent1_latitude;
    }

    public void setAgent1_latitude(double agent1_latitude) {
        this.agent1_latitude = agent1_latitude;
    }

    public double getAgent1_longitude() {
        return agent1_longitude;
    }

    public void setAgent1_longitude(double agent1_longitude) {
        this.agent1_longitude = agent1_longitude;
    }

    public String getAgent1_address() {
        return agent1_address;
    }

    public void setAgent1_address(String agent1_address) {
        this.agent1_address = agent1_address;
    }

    public String getAgent1_city() {
        return agent1_city;
    }

    public void setAgent1_city(String agent1_city) {
        this.agent1_city = agent1_city;
    }

    public String getAgent1_state() {
        return agent1_state;
    }

    public void setAgent1_state(String agent1_state) {
        this.agent1_state = agent1_state;
    }

    public String getAgent1_zipcode() {
        return agent1_zipcode;
    }

    public void setAgent1_zipcode(String agent1_zipcode) {
        this.agent1_zipcode = agent1_zipcode;
    }

    public String getAgent1_phone_number() {
        return agent1_phone_number;
    }

    public void setAgent1_phone_number(String agent1_phone_number) {
        this.agent1_phone_number = agent1_phone_number;
    }

    public String getAgent1_customer_fullname() {
        return agent1_customer_fullname;
    }

    public void setAgent1_customer_fullname(String agent1_customer_fullname) {
        this.agent1_customer_fullname = agent1_customer_fullname;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public double getAgent2_longitude() {
        return agent2_longitude;
    }

    public void setAgent2_longitude(double agent2_longitude) {
        this.agent2_longitude = agent2_longitude;
    }

    public double getAgent2_latitude() {
        return agent2_latitude;
    }

    public void setAgent2_latitude(double agent2_latitude) {
        this.agent2_latitude = agent2_latitude;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public double getPrice() {
        return price*0.6; /// driver gets 60% payment on original price.
    }

    public void setPrice(long price) {
        this.price = price;
    }
    public String getAgent2_address() {
        return agent2_address;
    }

    public void setAgent2_address(String agent2_address) {
        this.agent2_address = agent2_address;
    }

    public String getAgent2_city() {
        return agent2_city;
    }

    public void setAgent2_city(String agent2_city) {
        this.agent2_city = agent2_city;
    }

    public String getAgent2_state() {
        return agent2_state;
    }

    public void setAgent2_state(String agent2_state) {
        this.agent2_state = agent2_state;
    }

    public String getAgent2_zipcode() {
        return agent2_zipcode;
    }

    public void setAgent2_zipcode(String agent2_zipcode) {
        this.agent2_zipcode = agent2_zipcode;
    }

    public String getAgent2_phone_number() {
        return agent2_phone_number;
    }

    public void setAgent2_phone_number(String agent2_phone_number) {
        this.agent2_phone_number = agent2_phone_number;
    }

    public String getAgent2_customer_fullname() {
        return agent2_customer_fullname;
    }

    public void setAgent2_customer_fullname(String agent2_customer_fullname) {
        this.agent2_customer_fullname = agent2_customer_fullname;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getFinal_cost() {
        return final_cost;
    }

    public void setFinal_cost(String final_cost) {
        this.final_cost = final_cost;
    }

    public String getTotal_price() {
        return total_price;
    }

    public void setTotal_price(String total_price) {
        this.total_price = total_price;
    }

    public String getMerchant_name() {
        return merchant_name;
    }

    public void setMerchant_name(String merchant_name) {
        this.merchant_name = merchant_name;
    }

    public String getMerchant_id() {
        return merchant_id;
    }

    public void setMerchant_id(String merchant_id) {
        this.merchant_id = merchant_id;
    }

    public String getMerchant_token() {
        return merchant_token;
    }

    public void setMerchant_token(String merchant_token) {
        this.merchant_token = merchant_token;
    }

    public String getMerchant_image() {
        return merchant_image;
    }

    public void setMerchant_image(String merchant_image) {
        this.merchant_image = merchant_image;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdPelanggan() {
        return idPelanggan;
    }

    public void setIdPelanggan(String idPelanggan) {
        this.idPelanggan = idPelanggan;
    }

    public String getIdDriver() {
        return idDriver;
    }

    public void setIdDriver(String idDriver) {
        this.idDriver = idDriver;
    }

    public String getOrderFitur() {
        return orderFitur;
    }

    public void setOrderFitur(String orderFitur) {
        this.orderFitur = orderFitur;
    }

    public double getStartLatitude() {
        return startLatitude;
    }

    public void setStartLatitude(double startLatitude) {
        this.startLatitude = startLatitude;
    }

    public double getStartLongitude() {
        return startLongitude;
    }

    public void setStartLongitude(double startLongitude) {
        this.startLongitude = startLongitude;
    }

    public double getEndLatitude() {
        return endLatitude;
    }

    public void setEndLatitude(double endLatitude) {
        this.endLatitude = endLatitude;
    }

    public double getEndLongitude() {
        return endLongitude;
    }

    public void setEndLongitude(double endLongitude) {
        this.endLongitude = endLongitude;
    }

    public double getJarak() {
        return distance;
    }

    public void setJarak(double distance) {
        this.distance = distance;
    }

    public double getHarga() {
        return price*0.6; /// driver gets 60% payment on original price.
    }

    public void setHarga(long price) {
        this.price = price;
    }

    public Date getWaktuOrder() {
        return waktuOrder;
    }

    public void setWaktuOrder(Date waktuOrder) {
        this.waktuOrder = waktuOrder;
    }

    public Date getWaktuSelesai() {
        return waktuSelesai;
    }

    public void setWaktuSelesai(Date waktuSelesai) {
        this.waktuSelesai = waktuSelesai;
    }

    public String getAlamatAsal() {
        return alamatAsal;
    }

    public void setAlamatAsal(String alamatAsal) {
        this.alamatAsal = alamatAsal;
    }

    public String getAlamatTujuan() {
        return alamatTujuan;
    }

    public void setAlamatTujuan(String alamatTujuan) {
        this.alamatTujuan = alamatTujuan;
    }

    public String getKodePromo() {
        return kodePromo;
    }

    public void setKodePromo(String kodePromo) {
        this.kodePromo = kodePromo;
    }

    public String getKreditPromo() {
        return kreditPromo;
    }

    public void setKreditPromo(String kreditPromo) {
        this.kreditPromo = kreditPromo;
    }

    public boolean isPakaiWallet() {
        return pakaiWallet;
    }

    public void setPakaiWallet(boolean pakaiWallet) {
        this.pakaiWallet = pakaiWallet;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getEstimasi() {
        return estimasi;
    }

    public void setEstimasi(String estimasi) {
        this.estimasi = estimasi;
    }

    public String getNamaPengirim() {
        return namaPengirim;
    }

    public void setNamaPengirim(String namaPengirim) {
        this.namaPengirim = namaPengirim;
    }

    public String getNamaPenerima() {
        return namaPenerima;
    }

    public void setNamaPenerima(String namaPenerima) {
        this.namaPenerima = namaPenerima;
    }

    public String getTeleponPengirim() {
        return teleponPengirim;
    }

    public void setTeleponPengirim(String teleponPengirim) {
        this.teleponPengirim = teleponPengirim;
    }

    public String getTeleponPenerima() {
        return teleponPengirim;
    }

    public void setTeleponPenerima(String teleponPenerima) {
        this.teleponPenerima = teleponPenerima;
    }

    public String getNamaBarang() {
        return namaBarang;
    }

    public void setNamaBarang(String namaBarang) {
        this.namaBarang = namaBarang;
    }

    public String getBiaya_akhir() {
        return final_cost;
    }

    public void setBiaya_akhir(String final_cost) {
        this.final_cost = final_cost;
    }

    public String getTotal_biaya() {
        return total_price;
    }

    public void setTotal_biaya(String total_price) {
        this.total_price = total_price;
    }

    public String getNama_merchant() {
        return merchant_name;
    }

    public void setNama_merchant(String merchant_name) {
        this.merchant_name = merchant_name;
    }

    public String getTeleponmerchant() {
        return teleponmerchant;
    }

    public void setTeleponmerchant(String teleponmerchant) {
        this.teleponmerchant = teleponmerchant;
    }

    public String getId_merchant() {
        return merchant_id;
    }

    public void setId_merchant(String merchant_id) {
        this.merchant_id = merchant_id;
    }

    public String getToken_merchant() {
        return merchant_token;
    }

    public void setToken_merchant(String merchant_token) {
        this.merchant_token = merchant_token;
    }

    public String getFoto_merchant() {
        return merchant_image;
    }

    public void setFoto_merchant(String merchant_image) {
        this.merchant_image = merchant_image;
    }

    public String getIdtransmerchant() {
        return idtransmerchant;
    }

    public void setIdtransmerchant(String idtransmerchant) {
        this.idtransmerchant = idtransmerchant;
    }

    public String getHome() {
        return home;
    }

    public void setHome(String home) {
        this.home = home;
    }
}
