package com.slog.agentassignment.utils.api.service;

import com.slog.agentassignment.json.AgentResponseJson;
import com.slog.agentassignment.json.AllMerchantByNearResponseJson;
import com.slog.agentassignment.json.AllMerchantbyCatRequestJson;
import com.slog.agentassignment.json.AllTransResponseJson;
import com.slog.agentassignment.json.BankResponseJson;
import com.slog.agentassignment.json.NewsDetailRequestJson;
import com.slog.agentassignment.json.NewsDetailResponseJson;
import com.slog.agentassignment.json.ChangePassRequestJson;
import com.slog.agentassignment.json.DetailRequestJson;
import com.slog.agentassignment.json.EditprofileRequestJson;
import com.slog.agentassignment.json.GetAllMerchantbyCatRequestJson;
import com.slog.agentassignment.json.GetServiceResponseJson;
import com.slog.agentassignment.json.GetHomeRequestJson;
import com.slog.agentassignment.json.GetHomeResponseJson;
import com.slog.agentassignment.json.GetMerchantbyCatRequestJson;
import com.slog.agentassignment.json.LoginRequestJson;
import com.slog.agentassignment.json.LoginResponseJson;
import com.slog.agentassignment.json.MerchantByCatResponseJson;
import com.slog.agentassignment.json.MerchantByIdResponseJson;
import com.slog.agentassignment.json.MerchantByNearResponseJson;
import com.slog.agentassignment.json.MerchantbyIdRequestJson;
import com.slog.agentassignment.json.PrivacyRequestJson;
import com.slog.agentassignment.json.PrivacyResponseJson;
import com.slog.agentassignment.json.PromoRequestJson;
import com.slog.agentassignment.json.PromoResponseJson;
import com.slog.agentassignment.json.RateRequestJson;
import com.slog.agentassignment.json.RateResponseJson;
import com.slog.agentassignment.json.RegisterRequestJson;
import com.slog.agentassignment.json.RegisterResponseJson;
import com.slog.agentassignment.json.ResponseJson;
import com.slog.agentassignment.json.SearchMerchantbyCatRequestJson;
import com.slog.agentassignment.json.StripeRequestJson;
import com.slog.agentassignment.json.TopupRequestJson;
import com.slog.agentassignment.json.TopupResponseJson;
import com.slog.agentassignment.json.WalletRequestJson;
import com.slog.agentassignment.json.WalletResponseJson;
import com.slog.agentassignment.json.WithdrawRequestJson;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;

/**
 * Created by Ourdevelops Team on 10/13/2019.
 */

public interface UserService {

    @POST("customerapi/login")
    Call<LoginResponseJson> login(@Body LoginRequestJson param);

    @POST("customerapi/kodepromo")
    Call<PromoResponseJson> promocode(@Body PromoRequestJson param);

    @POST("customerapi/listkodepromo")
    Call<PromoResponseJson> listpromocode(@Body PromoRequestJson param);

    @POST("customerapi/list_bank")
    Call<BankResponseJson> listbank(@Body WithdrawRequestJson param);

    @POST("customerapi/changepass")
    Call<LoginResponseJson> changepass(@Body ChangePassRequestJson param);

    @POST("customerapi/register_user")
    Call<RegisterResponseJson> register(@Body RegisterRequestJson param);

    @GET("customerapi/detail_fitur")
    Call<GetServiceResponseJson> getFitur();

    @POST("customerapi/request_agents_list")
    Call<AgentResponseJson> request_agents_list(@Body AgentResponseJson param);

    @POST("customerapi/forgot")
    Call<LoginResponseJson> forgot(@Body LoginRequestJson param);

    @POST("customerapi/privacy")
    Call<PrivacyResponseJson> privacy(@Body PrivacyRequestJson param);

    @POST("customerapi/home")
    Call<GetHomeResponseJson> home(@Body GetHomeRequestJson param);

    @POST("customerapi/topupstripe")
    Call<TopupResponseJson> topup(@Body TopupRequestJson param);

    @POST("customerapi/stripeaction")
    Call<ResponseJson> actionstripe(@Body StripeRequestJson param);

    @POST("customerapi/intentstripe")
    Call<ResponseJson> intentstripe(@Body StripeRequestJson param);

    @POST("customerapi/withdraw")
    Call<ResponseJson> withdraw(@Body WithdrawRequestJson param);

    @POST("customerapi/topuppaypal")
    Call<ResponseJson> topuppaypal(@Body WithdrawRequestJson param);

    @POST("customerapi/rate_driver")
    Call<RateResponseJson> rateDriver(@Body RateRequestJson param);

    @POST("customerapi/edit_profile")
    Call<RegisterResponseJson> editProfile(@Body EditprofileRequestJson param);

    @POST("customerapi/wallet")
    Call<WalletResponseJson> wallet(@Body WalletRequestJson param);

    @POST("customerapi/history_progress")
    Call<AllTransResponseJson> history(@Body DetailRequestJson param);

    @POST("customerapi/detail_berita")
    Call<NewsDetailResponseJson> beritadetail(@Body NewsDetailRequestJson param);

    @POST("customerapi/all_berita")
    Call<NewsDetailResponseJson> allberita(@Body NewsDetailRequestJson param);

    @POST("customerapi/merchantbykategoripromo")
    Call<MerchantByCatResponseJson> getmerchanbycat(@Body GetMerchantbyCatRequestJson param);

    @POST("customerapi/merchantbykategori")
    Call<MerchantByNearResponseJson> getmerchanbynear(@Body GetMerchantbyCatRequestJson param);

    @POST("customerapi/allmerchantbykategori")
    Call<AllMerchantByNearResponseJson> getallmerchanbynear(@Body GetAllMerchantbyCatRequestJson param);

    @POST("customerapi/itembykategori")
    Call<MerchantByIdResponseJson> getitembycat(@Body GetAllMerchantbyCatRequestJson param);

    @POST("customerapi/searchmerchant")
    Call<AllMerchantByNearResponseJson> searchmerchant(@Body SearchMerchantbyCatRequestJson param);

    @POST("customerapi/allmerchant")
    Call<AllMerchantByNearResponseJson> allmerchant(@Body AllMerchantbyCatRequestJson param);

    @POST("customerapi/merchantbyid")
    Call<MerchantByIdResponseJson> merchantbyid(@Body MerchantbyIdRequestJson param);


}
