package com.slog.driver.fragment;


import android.annotation.SuppressLint;
import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.facebook.shimmer.ShimmerFrameLayout;
import com.mapbox.android.core.location.LocationEngine;
import com.mapbox.android.core.location.LocationEngineCallback;
import com.mapbox.android.core.location.LocationEngineProvider;
import com.mapbox.android.core.location.LocationEngineRequest;
import com.mapbox.android.core.location.LocationEngineResult;
import com.mapbox.android.core.permissions.PermissionsManager;
import com.mapbox.mapboxsdk.geometry.LatLng;
import com.mapbox.mapboxsdk.location.LocationComponentOptions;
import com.slog.driver.R;
import com.slog.driver.constants.BaseApp;
import com.slog.driver.item.AgentItem;
import com.slog.driver.item.HistoryItem;
import com.slog.driver.json.AllAgebtResponseJson;
import com.slog.driver.json.AllTransResponseJson;
import com.slog.driver.json.DetailRequestJson;
import com.slog.driver.json.FreshDetailRequestJson;
import com.slog.driver.models.User;
import com.slog.driver.utils.Log;
import com.slog.driver.utils.SettingPreference;
import com.slog.driver.utils.api.ServiceGenerator;
import com.slog.driver.utils.api.service.DriverService;
import com.slog.driver.utils.api.service.LocService;

import java.util.Objects;
import java.util.Timer;
import java.util.TimerTask;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

import static android.os.Looper.getMainLooper;
import static com.slog.driver.activity.MainActivity.mainActivity;
import static com.slog.driver.utils.MyLocationService.getBearing;


public class FreshOrderFragment extends Fragment {


    private Context context;
    private ShimmerFrameLayout shimmer;
    private RecyclerView recycle;
    private HistoryItem historyItem;
    private RelativeLayout rlnodata;
    SettingPreference sp;
    Location location;
    @Override
    public View onCreateView(final LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View getView = inflater.inflate(R.layout.fragment_recycle, container, false);
        context = getContext();
        shimmer = getView.findViewById(R.id.shimmerwallet);
        recycle = getView.findViewById(R.id.inboxlist);
        rlnodata = getView.findViewById(R.id.rlnodata);

        recycle.setHasFixedSize(true);
        recycle.setLayoutManager(new GridLayoutManager(context, 1));
        sp = new SettingPreference(getActivity());
        initLocationEngine();
        return getView;
    }

    private void shimmershow() {
        recycle.setVisibility(View.GONE);
        shimmer.setVisibility(View.VISIBLE);
        shimmer.startShimmerAnimation();
    }

    private void shimmertutup() {

        recycle.setVisibility(View.VISIBLE);
        shimmer.setVisibility(View.GONE);
        try {
            shimmer.stopShimmerAnimation();
        }catch (RuntimeException e){
        }catch (Exception e){
        }
    }

    LocationEngine locationEngine;
    private LocationChangeListeningActivityLocationCallback callback =
            new LocationChangeListeningActivityLocationCallback();

    @SuppressLint("MissingPermission")
    public void initLocationEngine() {
        if (PermissionsManager.areLocationPermissionsGranted(getActivity())) {
            locationEngine = LocationEngineProvider.getBestLocationEngine(getActivity());
            LocationEngineRequest request = new LocationEngineRequest.Builder(4000L)
                    .setPriority(LocationEngineRequest.PRIORITY_HIGH_ACCURACY).build();
            locationEngine.requestLocationUpdates(request, callback, getMainLooper());
            locationEngine.getLastLocation(callback);
        }
    }

    Location newlocation;
    private class LocationChangeListeningActivityLocationCallback
            implements LocationEngineCallback<LocationEngineResult> {

        LocationChangeListeningActivityLocationCallback() {
        }

        @Override
        public void onSuccess(LocationEngineResult result) {
            location = result.getLastLocation();
            LatLng latLng = new LatLng(location.getLatitude(),location.getLongitude());
            LatLng newlatlang = new LatLng(Double.parseDouble(sp.getSetting()[20]),Double.parseDouble(sp.getSetting()[21]));
            newlocation = new Location("ourdevelops");
            newlocation.setLatitude(location.getLatitude());
            newlocation.setLongitude(location.getLongitude());
            newlocation.setBearing(getBearing(latLng,newlatlang));

        }

        @Override
        public void onFailure(@NonNull Exception exception) {

        }
    }

//    private void getdatatrans() {
//        shimmershow();
//        try {
//            User loginUser = BaseApp.getInstance(context).getLoginUser();
//            DriverService driverService = ServiceGenerator.createService(
//                    DriverService.class, loginUser.getNoTelepon(), loginUser.getPassword());
//            FreshDetailRequestJson param = new FreshDetailRequestJson();
//            param.setDriver_id(loginUser.getId());
//            param.setLatitude(String.valueOf(location.getLatitude()));
//            param.setLongitude(String.valueOf(location.getLongitude()));
//            driverService.freshorder(param).enqueue(new Callback<AllTransResponseJson>() {
//                @Override
//                public void onResponse(@NonNull Call<AllTransResponseJson> call, @NonNull Response<AllTransResponseJson> response) {
//                    if (response.isSuccessful()) {
//                        shimmertutup();
//                        historyItem = new HistoryItem(context, Objects.requireNonNull(response.body()).getData(), R.layout.item_order);
//                        recycle.setAdapter(historyItem);
//                        if (response.body().getData().size() <=0 ) {
//                            recycle.setVisibility(View.GONE);
//                            rlnodata.setVisibility(View.VISIBLE);
//                        } else {
//                            recycle.setVisibility(View.VISIBLE);
//                            rlnodata.setVisibility(View.GONE);
//                        }
//                    }else{
//                        shimmertutup();
//                        recycle.setVisibility(View.GONE);
//                        rlnodata.setVisibility(View.VISIBLE);
//                    }
//                }
//
//                @Override
//                public void onFailure(@NonNull Call<AllTransResponseJson> call, @NonNull Throwable t) {
//                    shimmertutup();
//                }
//            });
//        }catch (IllegalStateException e){
//            shimmertutup();
//        }catch (Exception e){
//            shimmertutup();
//        }
//
//    }

    private void getdatatrans() {
        shimmershow();

        try {
            Log.d("response","getnearest");

            User loginUser = BaseApp.getInstance(context).getLoginUser();
            DriverService driverService = ServiceGenerator.createService(
                    DriverService.class, loginUser.getNoTelepon(), loginUser.getPassword());
            FreshDetailRequestJson param = new FreshDetailRequestJson();
            param.setDriver_id(loginUser.getId());
            param.setLatitude(String.valueOf(location.getLatitude()));
            param.setLongitude(String.valueOf(location.getLongitude()));
            driverService.acptorder(param).enqueue(new Callback<AllTransResponseJson>() {
                @Override
                public void onResponse(@NonNull Call<AllTransResponseJson> call, @NonNull Response<AllTransResponseJson> response) {
                    Log.d("response",""+response);
                    if (response.isSuccessful()) {
                        shimmertutup();
                        historyItem = new HistoryItem(context, Objects.requireNonNull(response.body()).getData(), R.layout.item_order);
                        recycle.setAdapter(historyItem);
                        if (response.body().getData().size() <=0 ) {
                            recycle.setVisibility(View.GONE);
                            rlnodata.setVisibility(View.VISIBLE);
                        } else {
                            recycle.setVisibility(View.VISIBLE);
                            rlnodata.setVisibility(View.GONE);
                        }
                    }else{
                        shimmertutup();
                        recycle.setVisibility(View.GONE);
                        rlnodata.setVisibility(View.VISIBLE);
                    }
                }

                @Override
                public void onFailure(@NonNull Call<AllTransResponseJson> call, @NonNull Throwable t) {
                    t.printStackTrace();
                    shimmertutup();
                    recycle.setVisibility(View.GONE);
                    rlnodata.setVisibility(View.VISIBLE);
                }
            });
        }catch (IllegalStateException e){
            e.printStackTrace();
            shimmertutup();
            recycle.setVisibility(View.GONE);
            rlnodata.setVisibility(View.VISIBLE);
        }catch (Exception e){
            e.printStackTrace();
            shimmertutup();
            recycle.setVisibility(View.GONE);
            rlnodata.setVisibility(View.VISIBLE);
        }

    }

    @Override
    public void onResume() {
        super.onResume();

        getdatatrans();
        Timer timer = new Timer ();
        TimerTask hourlyTask = new TimerTask () {
            @Override
            public void run () {
                // your code here...
                getdatatrans();
            }
        };

        timer.schedule (hourlyTask, 0l, 1000*10*60);
    }
}
