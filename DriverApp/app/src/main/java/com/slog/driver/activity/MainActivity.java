package com.slog.driver.activity;

import android.Manifest;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.location.Location;
import android.location.LocationManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.bottomnavigation.LabelVisibilityMode;
import com.mapbox.mapboxsdk.Mapbox;
import com.slog.driver.R;
import com.slog.driver.constants.BaseApp;
import com.slog.driver.constants.Constant;
import com.slog.driver.constants.VersionChecker;
import com.slog.driver.fragment.FreshOrderFragment;
import com.slog.driver.fragment.HistoryFragment;
import com.slog.driver.fragment.HomeFragment;
import com.slog.driver.fragment.MessageFragment;
import com.slog.driver.fragment.OrderFragment;
import com.slog.driver.fragment.ProfileFragment;
import com.slog.driver.json.GetHomeRequestJson;
import com.slog.driver.json.GetHomeResponseJson;
import com.slog.driver.json.ResponseJson;
import com.slog.driver.json.UpdateLocationRequestJson;
import com.slog.driver.models.PayuModel;
import com.slog.driver.models.TransModel;
import com.slog.driver.models.User;
import com.slog.driver.utils.SettingPreference;
import com.slog.driver.utils.api.ServiceGenerator;
import com.slog.driver.utils.api.service.DriverService;

import java.util.Objects;

import io.realm.Realm;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class MainActivity extends AppCompatActivity {
    long mBackPressed;

    LinearLayout mAdViewLayout;

    @SuppressLint("StaticFieldLeak")
    public static MainActivity mainActivity;
    private FragmentManager fragmentManager;
    BottomNavigationView navigation;
    int previousSelect = 0;
    SettingPreference sp;
    OrderFragment orderFragment;
    HomeFragment homeFragment;
    RelativeLayout rlprogress;
    boolean canceled;
    static ImageButton imrunning;

    public static MainActivity getInstance() {
        return mainActivity;
    }

    private BottomNavigationView.OnNavigationItemSelectedListener mOnNavigationItemSelectedListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {

        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            Menu menu = navigation.getMenu();
            menu.findItem(R.id.home).setIcon(R.drawable.ic_home);
            menu.findItem(R.id.freshorder).setIcon(R.drawable.ic_baseline_cached_24);
            menu.findItem(R.id.order).setIcon(R.drawable.ic_transaksi);
//            menu.findItem(R.id.chat).setIcon(R.drawable.ic_pesan);
            menu.findItem(R.id.profile).setIcon(R.drawable.ic_profil);

            TransModel transaksi = new TransModel();
            switch (item.getItemId()) {
                case R.id.home:
                    GPSStatus();
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                        int flags = getWindow().getDecorView().getSystemUiVisibility();
                        flags = flags ^ View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                        getWindow().getDecorView().setSystemUiVisibility(flags);
                        getWindow().setStatusBarColor(getResources().getColor(R.color.colorgradient));
                    }
                    canceled = false;
                    navigationItemSelected(0);
                    item.setIcon(R.drawable.ic_home_s);
                    gethome();
                    return true;
                case R.id.freshorder:
                    GPSStatus();
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                        int flags = MainActivity.this.getWindow().getDecorView().getSystemUiVisibility(); // get current flag
                        flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;   // add LIGHT_STATUS_BAR to flag
                        MainActivity.this.getWindow().getDecorView().setSystemUiVisibility(flags);
                        MainActivity.this.getWindow().setStatusBarColor(Color.WHITE); // optional
                    }
                    canceled = true;
                    rlprogress.setVisibility(View.GONE);
                    FreshOrderFragment flistFragment = new FreshOrderFragment();
                    navigationItemSelected(1);
                    item.setIcon(R.drawable.ic_baseline_cached_sel);
                    loadFrag2(flistFragment, getString(R.string.fresh_order), fragmentManager, transaksi, "", "");
                    return true;
                case R.id.order:
                    GPSStatus();
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                        int flags = MainActivity.this.getWindow().getDecorView().getSystemUiVisibility(); // get current flag
                        flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;   // add LIGHT_STATUS_BAR to flag
                        MainActivity.this.getWindow().getDecorView().setSystemUiVisibility(flags);
                        MainActivity.this.getWindow().setStatusBarColor(Color.WHITE); // optional
                    }
                    canceled = true;
                    rlprogress.setVisibility(View.GONE);
                    HistoryFragment listFragment = new HistoryFragment();
                    navigationItemSelected(2);
                    item.setIcon(R.drawable.ic_transaksi_s);
                    loadFrag2(listFragment, getString(R.string.menu_home), fragmentManager, transaksi, "", "");
                    return true;
               /* Code change made on 3/08/2022
                Commenting out below code*/
               /* case R.id.chat:
                    GPSStatus();
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                        int flags = MainActivity.this.getWindow().getDecorView().getSystemUiVisibility(); // get current flag
                        flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;   // add LIGHT_STATUS_BAR to flag
                        MainActivity.this.getWindow().getDecorView().setSystemUiVisibility(flags);
                        MainActivity.this.getWindow().setStatusBarColor(Color.WHITE); // optional
                    }
                    canceled = true;
                    rlprogress.setVisibility(View.GONE);
                    MessageFragment pesanFragment = new MessageFragment();
                    navigationItemSelected(3);
                    item.setIcon(R.drawable.ic_pesan_s);
                    loadFrag2(pesanFragment, getString(R.string.menu_chat), fragmentManager, transaksi, "", "");
                    return true;*/
                case R.id.profile:
                    GPSStatus();
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                        int flags = MainActivity.this.getWindow().getDecorView().getSystemUiVisibility(); // get current flag
                        flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;   // add LIGHT_STATUS_BAR to flag
                        MainActivity.this.getWindow().getDecorView().setSystemUiVisibility(flags);
                        MainActivity.this.getWindow().setStatusBarColor(Color.WHITE); // optional
                    }
                    canceled = true;
                    rlprogress.setVisibility(View.GONE);
                    ProfileFragment profilFragment = new ProfileFragment();
                    navigationItemSelected(4);
                    item.setIcon(R.drawable.ic_profil_s);
                    loadFrag2(profilFragment, getString(R.string.menu_profile), fragmentManager, transaksi, "", "");
                    return true;

            }
            return false;
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        GPSStatus();
        Mapbox.getInstance(this, getString(R.string.mapbox_access_token));
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mAdViewLayout = findViewById(R.id.adView);
        fragmentManager = getSupportFragmentManager();
        navigation = findViewById(R.id.navigation);
        imrunning = findViewById(R.id.imrunning);
        sp = new SettingPreference(this);
        orderFragment = new OrderFragment();
        homeFragment = new HomeFragment();
        navigation.setLabelVisibilityMode(LabelVisibilityMode.LABEL_VISIBILITY_LABELED);
        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);
        navigation.setItemIconTintList(null);
        Menu menu = navigation.getMenu();
        rlprogress = findViewById(R.id.rlprogress);
        menu.findItem(R.id.home).setIcon(R.drawable.ic_home_s);
        canceled = false;
        User loginUser = BaseApp.getInstance(this).getLoginUser();
        Constant.TOKEN = loginUser.getToken();
        Constant.USERID = loginUser.getId();

        PackageInfo packageInfo = null;
        try {
            packageInfo = getPackageManager().getPackageInfo(getPackageName(), 0);
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        Constant.versionname = Objects.requireNonNull(packageInfo).versionName;

        if (sp.getSetting()[19].equals("2") || sp.getSetting()[19].equals("3")) {
            navigation.setVisibility(View.GONE);
        } else {
            navigation.setVisibility(View.VISIBLE);
        }

        imrunning.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    if (!TextUtils.isEmpty(transaksi.getIdPelanggan())) {
                        loadFrag2(orderFragment, getString(R.string.menu_home), fragmentManager, transaksi, response1.body().getSaldo(),
                                response1.body().getDriverstatus());
                    } else {
                        Toast.makeText(MainActivity.this, "No running order found.", Toast.LENGTH_SHORT).show();
                    }
                }catch (NullPointerException e){
                    Toast.makeText(MainActivity.this, "No running order found.", Toast.LENGTH_SHORT).show();

                }catch (Exception e){
                    Toast.makeText(MainActivity.this, "No running order found.", Toast.LENGTH_SHORT).show();

                }


            }
        });

    }

    public static void runningorder() {
        imrunning.performClick();
    }

    @Override
    protected void onResume() {
        super.onResume();
        Check_version();
        GPSStatus();

        gethome();
    }

    public void Check_version() {
        VersionChecker versionChecker = new VersionChecker(this);
        versionChecker.execute();
    }

    @Override
    public void onBackPressed() {
        int count = this.getSupportFragmentManager().getBackStackEntryCount();
        if (count == 0) {
            if (mBackPressed + 2000 > System.currentTimeMillis()) {
                super.onBackPressed();
            } else {
                clickDone();

            }
        } else {
            super.onBackPressed();
        }
    }

    public void clickDone() {
        new AlertDialog.Builder(this, R.style.DialogStyle)
                .setIcon(R.mipmap.ic_launcher)
                .setTitle(getString(R.string.app_name))
                .setMessage(getString(R.string.exit))
                .setPositiveButton(getString(R.string.yes), new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                        finish();
                    }
                })
                .setNegativeButton(getString(R.string.no), new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                })
                .show();
    }

    TransModel transaksifake;
    TransModel transaksi;
    Response<GetHomeResponseJson> response1;

    private void gethome() {

        rlprogress.setVisibility(View.VISIBLE);
        User loginUser = BaseApp.getInstance(this).getLoginUser();
        DriverService userService = ServiceGenerator.createService(
                DriverService.class, loginUser.getNoTelepon(), loginUser.getPassword());
        GetHomeRequestJson param = new GetHomeRequestJson();
        param.setId(loginUser.getId());
        param.setPhone(loginUser.getNoTelepon());
        userService.home(param).enqueue(new Callback<GetHomeResponseJson>() {
            @Override
            public void onResponse(@NonNull Call<GetHomeResponseJson> call, @NonNull final Response<GetHomeResponseJson> response) {
                response1 = response;
                if (response.isSuccessful()) {
                    if (Objects.requireNonNull(response.body()).getMessage().equalsIgnoreCase("success")) {
                        PayuModel payu = response.body().getPayu().get(0);
                        Constant.CURRENCY = response.body().getCurrency();
                        sp.updateCurrency(response.body().getCurrency());
                        sp.updateabout(response.body().getAboutus());
                        sp.updateemail(response.body().getEmail());
                        sp.updatephone(response.body().getPhone());
                        sp.updateweb(response.body().getWebsite());
                        sp.updatePaypal(response.body().getPaypalkey());
                        sp.updatepaypalmode(response.body().getPaypalmode());
                        sp.updatepaypalactive(response.body().getPaypalactive());
                        sp.updatestripeactive(response.body().getStripeactive());
                        sp.updatecurrencytext(response.body().getCurrencytext());
                        sp.updatePayudebug(payu.getPayudebug());
                        sp.updatePayumerchantid(payu.getPayuid());
                        sp.updatePayusalt(payu.getPayusalt());
                        sp.updatePayumerchantkey(payu.getPayukey());
                        sp.updatePayuActive(payu.getActive());
                        sp.updateStatusdriver(response.body().getDriverstatus());
                        sp.updateStripepublish(response.body().getStripePublish());

                        transaksifake = new TransModel();
                        if (!canceled) {
                            try {
                                if (response.body().getDriverstatus().equals("3") && !response.body().getTransaksi().isEmpty()
                                        || response.body().getDriverstatus().equals("2") && !response.body().getTransaksi().isEmpty()) {
                                    transaksi = response.body().getTransaksi().get(0);
                                    navigation.setVisibility(View.VISIBLE);
                                    loadFrag2(homeFragment, getString(R.string.menu_home), fragmentManager, transaksi, response.body().getSaldo(), response.body().getDriverstatus());
                                    rlprogress.setVisibility(View.GONE);
                                } else {
                                    navigation.setVisibility(View.VISIBLE);
                                    loadFrag2(homeFragment, getString(R.string.menu_home), fragmentManager, transaksifake, response.body().getSaldo(), response.body().getDriverstatus());
                                    rlprogress.setVisibility(View.GONE);
                                }
                            } catch (NullPointerException e) {
                                navigation.setVisibility(View.VISIBLE);
                                loadFrag2(homeFragment, getString(R.string.menu_home), fragmentManager, transaksifake,
                                        response.body().getSaldo(), response.body().getDriverstatus());
                                rlprogress.setVisibility(View.GONE);
                            } catch (Exception e) {
                                navigation.setVisibility(View.VISIBLE);
                                loadFrag2(homeFragment, getString(R.string.menu_home), fragmentManager, transaksifake, response.body().getSaldo(), response.body().getDriverstatus());
                                rlprogress.setVisibility(View.GONE);
                            }
                        }
                        try {
                            User user = response.body().getDatadriver().get(0);
                            saveUser(user);
                        } catch (NullPointerException e) {
                        } catch (Exception e) {
                        }
                        if (mainActivity != null) {
                            Realm realm = BaseApp.getInstance(MainActivity.this).getRealmInstance();
                            User loginUser = BaseApp.getInstance(MainActivity.this).getLoginUser();
                            realm.beginTransaction();
                            loginUser.setWalletSaldo(Long.parseLong(response.body().getSaldo()));
                            realm.commitTransaction();
                        }
                    } else {
                        Realm realm = BaseApp.getInstance(MainActivity.this).getRealmInstance();
                        realm.beginTransaction();
                        realm.delete(User.class);
                        realm.commitTransaction();
                        BaseApp.getInstance(MainActivity.this).setLoginUser(null);
                        startActivity(new Intent(MainActivity.this, IntroActivity.class)
                                .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK));
                        finish();
                        Toast.makeText(MainActivity.this, "Your account has been suspended, please contact admin!", Toast.LENGTH_SHORT).show();
                    }
                }
            }

            @Override
            public void onFailure(@NonNull Call<GetHomeResponseJson> call, @NonNull Throwable t) {

            }
        });

    }

    private void saveUser(User user) {
        Realm realm = Realm.getDefaultInstance();
        realm.beginTransaction();
        realm.delete(User.class);
        realm.copyToRealm(user);
        realm.commitTransaction();
        BaseApp.getInstance(MainActivity.this).setLoginUser(user);
    }

    public void loadFrag2(Fragment f1, String name, FragmentManager fm, TransModel transaksi, String balance, String status) {
        for (int i = 0; i < fm.getBackStackEntryCount(); ++i) {
            fm.popBackStack();
        }
        Bundle args = new Bundle();
        args.putString("customer_id", transaksi.getIdPelanggan());
        args.putString("transaction_id", transaksi.getId());
        args.putString("response", String.valueOf(transaksi.status));
        args.putString("balance", balance);
        args.putString("status", status);
        f1.setArguments(args);
        FragmentTransaction ft = fm.beginTransaction();
        ft.replace(R.id.Container, f1, name);
        ft.commitAllowingStateLoss();

    }

    public void navigationItemSelected(int position) {
        previousSelect = position;
    }

    public void Updatelocationdata(final Location location) {
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            public void run() {
                onLocationChanged(location);
            }
        });

    }

    public void onLocationChanged(Location location) {
        if (location != null) {
            User loginUser = BaseApp.getInstance(this).getLoginUser();
            DriverService service = ServiceGenerator.createService(DriverService.class, loginUser.getEmail(), loginUser.getPassword());
            UpdateLocationRequestJson param = new UpdateLocationRequestJson();

            param.setId(loginUser.getId());
            param.setLatitude(String.valueOf(location.getLatitude()));
            param.setLongitude(String.valueOf(location.getLongitude()));
            param.setBearing(String.valueOf(location.getBearing()));

            service.updatelocation(param).enqueue(new Callback<ResponseJson>() {
                @Override
                public void onResponse(@NonNull Call<ResponseJson> call, @NonNull Response<ResponseJson> response) {
                    if (response.isSuccessful()) {
                        Log.e("location", response.message());
                    }
                }

                @Override
                public void onFailure(@NonNull retrofit2.Call<ResponseJson> call, @NonNull Throwable t) {

                }
            });
        }
    }


    private void getLocationPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            requestPermissions(new String[]{Manifest.permission.ACCESS_FINE_LOCATION, Manifest.permission.ACCESS_COARSE_LOCATION},
                    123);
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        switch (requestCode) {
            case 123:
                if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    GetCurrentlocation();
                } else {

                    Toast.makeText(this, "Please Grant permission", Toast.LENGTH_SHORT).show();
                }
                break;
        }

    }


    public void GPSStatus() {
        LocationManager lm = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
        boolean gps_enabled = false;
        boolean network_enabled = false;

        try {
            gps_enabled = Objects.requireNonNull(lm).isProviderEnabled(LocationManager.GPS_PROVIDER);
        } catch (Exception ignored) {
        }

        try {
            network_enabled = Objects.requireNonNull(lm).isProviderEnabled(LocationManager.NETWORK_PROVIDER);
        } catch (Exception ignored) {
        }

        if (!gps_enabled && !network_enabled) {
            Toast.makeText(this, "On Location in High Accuracy", Toast.LENGTH_SHORT).show();
            startActivityForResult(new Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS), 2);
        } else {
            GetCurrentlocation();
        }
    }


    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 2) {
            GPSStatus();
        }
    }

    private void GetCurrentlocation() {
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            getLocationPermission();
        }
    }


}
