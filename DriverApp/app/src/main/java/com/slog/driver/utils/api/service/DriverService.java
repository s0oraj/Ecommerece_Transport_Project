package com.slog.driver.utils.api.service;

import com.slog.driver.json.AcceptRequestJson;
import com.slog.driver.json.AcceptResponseJson;
import com.slog.driver.json.AllAgebtResponseJson;
import com.slog.driver.json.BankResponseJson;
import com.slog.driver.json.ChangePassRequestJson;
import com.slog.driver.json.FreshDetailRequestJson;
import com.slog.driver.json.GetOnRequestJson;
import com.slog.driver.json.JobResponseJson;
import com.slog.driver.json.StripeRequestJson;
import com.slog.driver.json.UpdateLocationRequestJson;
import com.slog.driver.json.AllTransResponseJson;
import com.slog.driver.json.DetailRequestJson;
import com.slog.driver.json.DetailTransResponseJson;
import com.slog.driver.json.EditVehicleRequestJson;
import com.slog.driver.json.EditprofileRequestJson;
import com.slog.driver.json.GetHomeRequestJson;
import com.slog.driver.json.GetHomeResponseJson;
import com.slog.driver.json.LoginRequestJson;
import com.slog.driver.json.LoginResponseJson;
import com.slog.driver.json.PrivacyRequestJson;
import com.slog.driver.json.PrivacyResponseJson;
import com.slog.driver.json.RegisterRequestJson;
import com.slog.driver.json.RegisterResponseJson;
import com.slog.driver.json.ResponseJson;
import com.slog.driver.json.TopupRequestJson;
import com.slog.driver.json.TopupResponseJson;
import com.slog.driver.json.VerifyRequestJson;
import com.slog.driver.json.WalletRequestJson;
import com.slog.driver.json.WalletResponseJson;
import com.slog.driver.json.WithdrawRequestJson;
import com.slog.driver.json.WithdrawResponseJson;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.POST;

/**
 * Created by Ourdevelops Team on 10/13/2019.
 */

public interface DriverService {

    @POST("driver/login")
    Call<LoginResponseJson> login(@Body LoginRequestJson param);

    @POST("driver/update_location")
    Call<ResponseJson> updatelocation(@Body UpdateLocationRequestJson param);

    @POST("driver/syncronizing_account")
    Call<GetHomeResponseJson> home(@Body GetHomeRequestJson param);

    @POST("driver/logout")
    Call<GetHomeResponseJson> logout(@Body GetHomeRequestJson param);

    @POST("driver/turning_on")
    Call<ResponseJson> turnon(@Body GetOnRequestJson param);

    @POST("driver/accept")
    Call<AcceptResponseJson> accept(@Body AcceptRequestJson param);

    @POST("driver/start")
    Call<AcceptResponseJson> startrequest(@Body AcceptRequestJson param);

    @POST("driver/finish")
    Call<AcceptResponseJson> finishrequest(@Body AcceptRequestJson param);

    @POST("driver/edit_profile")
    Call<LoginResponseJson> editProfile(@Body EditprofileRequestJson param);

    @POST("driver/edit_kendaraan")
    Call<LoginResponseJson> editKendaraan(@Body EditVehicleRequestJson param);

    @POST("driver/changepass")
    Call<LoginResponseJson> changepass(@Body ChangePassRequestJson param);

    @POST("driver/history_progress")
    Call<AllTransResponseJson> history(@Body DetailRequestJson param);

    @POST("driverfilter/findpackage")
    Call<AllTransResponseJson> freshorder(@Body FreshDetailRequestJson param);

    @POST("driver/accepted_orders_list")
    Call<AllTransResponseJson> acptorder(@Body FreshDetailRequestJson param);

    @POST("driverfilter/nearestagent")
    Call<AllAgebtResponseJson> nearestagent(@Body FreshDetailRequestJson param);

    @POST("driver/forgot")
    Call<LoginResponseJson> forgot(@Body LoginRequestJson param);

    @POST("driver/register_driver")
    Call<RegisterResponseJson> register(@Body RegisterRequestJson param);

    @POST("customerapi/list_bank")
    Call<BankResponseJson> listbank(@Body WithdrawRequestJson param);

    @POST("driver/detail_transaksi")
    Call<DetailTransResponseJson> detailtrans(@Body DetailRequestJson param);

    @POST("driver/job")
    Call<JobResponseJson> job();


    @POST("customerapi/privacy")
    Call<PrivacyResponseJson> privacy(@Body PrivacyRequestJson param);

    @POST("customerapi/topupstripe")
    Call<TopupResponseJson> topup(@Body TopupRequestJson param);

    @POST("driver/withdraw")
    Call<WithdrawResponseJson> withdraw(@Body WithdrawRequestJson param);

    @POST("customerapi/wallet")
    Call<WalletResponseJson> wallet(@Body WalletRequestJson param);

    @POST("driver/topuppaypal")
    Call<ResponseJson> topuppaypal(@Body WithdrawRequestJson param);

    @POST("driver/verifycode")
    Call<ResponseJson> verifycode(@Body VerifyRequestJson param);

    @POST("driver/stripeaction")
    Call<ResponseJson> actionstripe(@Body StripeRequestJson param);

    @POST("driver/intentstripe")
    Call<ResponseJson> intentstripe(@Body StripeRequestJson param);


}
