package com.slog.agentassignment.utils.api.service;


import com.slog.agentassignment.json.DriverRegisterRequestJson;
import com.slog.agentassignment.json.DriverRegisterResponseJson;
import com.slog.agentassignment.json.JobResponseJson;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.POST;

/**
 * Created by Ourdevelops Team on 10/13/2019.
 */

public interface DriverService {


    @POST("driver/register_driver")
    Call<DriverRegisterResponseJson> register(@Body DriverRegisterRequestJson param);

    @POST("driver/job")
    Call<JobResponseJson> job();

//    @POST("driver/received")
//    Call<>


}
