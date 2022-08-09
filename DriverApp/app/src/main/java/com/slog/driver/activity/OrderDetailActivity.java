package com.slog.driver.activity;

import android.Manifest;
import android.annotation.SuppressLint;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.widget.NestedScrollView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.facebook.shimmer.ShimmerFrameLayout;
import com.github.ornolfr.ratingview.RatingView;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.mapbox.api.directions.v5.DirectionsCriteria;
import com.mapbox.api.directions.v5.MapboxDirections;
import com.mapbox.api.directions.v5.models.DirectionsResponse;
import com.mapbox.api.directions.v5.models.DirectionsRoute;
import com.mapbox.geojson.Feature;
import com.mapbox.geojson.FeatureCollection;
import com.mapbox.geojson.LineString;
import com.mapbox.geojson.Point;
import com.mapbox.mapboxsdk.annotations.IconFactory;
import com.mapbox.mapboxsdk.annotations.Marker;
import com.mapbox.mapboxsdk.annotations.MarkerOptions;
import com.mapbox.mapboxsdk.camera.CameraPosition;
import com.mapbox.mapboxsdk.camera.CameraUpdateFactory;
import com.mapbox.mapboxsdk.geometry.LatLng;
import com.mapbox.mapboxsdk.maps.MapView;
import com.mapbox.mapboxsdk.maps.MapboxMap;
import com.mapbox.mapboxsdk.maps.OnMapReadyCallback;
import com.mapbox.mapboxsdk.maps.Style;
import com.mapbox.mapboxsdk.maps.UiSettings;
import com.mapbox.mapboxsdk.style.layers.CannotAddLayerException;
import com.mapbox.mapboxsdk.style.layers.LineLayer;
import com.mapbox.mapboxsdk.style.layers.Property;
import com.mapbox.mapboxsdk.style.layers.SymbolLayer;
import com.mapbox.mapboxsdk.style.sources.CannotAddSourceException;
import com.mapbox.mapboxsdk.style.sources.GeoJsonOptions;
import com.mapbox.mapboxsdk.style.sources.GeoJsonSource;
import com.mapbox.mapboxsdk.utils.BitmapUtils;
import com.slog.driver.R;
import com.slog.driver.constants.BaseApp;
import com.slog.driver.constants.Constant;
import com.slog.driver.item.ItemPesananItem;
import com.slog.driver.json.AcceptRequestJson;
import com.slog.driver.json.AcceptResponseJson;
import com.slog.driver.json.AllTransResponseJson;
import com.slog.driver.json.DetailRequestJson;
import com.slog.driver.json.DetailTransResponseJson;
import com.slog.driver.json.FreshDetailRequestJson;
import com.slog.driver.json.ResponseJson;
import com.slog.driver.json.VerifyRequestJson;
import com.slog.driver.json.fcm.FCMMessage;
import com.slog.driver.models.AllTransModel;
import com.slog.driver.models.CustomerModel;
import com.slog.driver.models.OrderFCM;
import com.slog.driver.models.TransModel;
import com.slog.driver.models.User;
import com.slog.driver.utils.PicassoTrustAll;
import com.slog.driver.utils.Utility;
import com.slog.driver.utils.api.FCMHelper;
import com.slog.driver.utils.api.ServiceGenerator;
import com.slog.driver.utils.api.service.DriverService;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

import javax.annotation.Nullable;

import butterknife.BindView;
import butterknife.ButterKnife;
import de.hdodenhof.circleimageview.CircleImageView;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import timber.log.Timber;

import static android.content.Intent.FLAG_ACTIVITY_NEW_TASK;
import static com.mapbox.core.constants.Constants.PRECISION_6;
import static com.mapbox.mapboxsdk.style.expressions.Expression.color;
import static com.mapbox.mapboxsdk.style.expressions.Expression.get;
import static com.mapbox.mapboxsdk.style.expressions.Expression.interpolate;
import static com.mapbox.mapboxsdk.style.expressions.Expression.lineProgress;
import static com.mapbox.mapboxsdk.style.expressions.Expression.linear;
import static com.mapbox.mapboxsdk.style.expressions.Expression.literal;
import static com.mapbox.mapboxsdk.style.expressions.Expression.match;
import static com.mapbox.mapboxsdk.style.expressions.Expression.stop;
import static com.mapbox.mapboxsdk.style.layers.PropertyFactory.iconAllowOverlap;
import static com.mapbox.mapboxsdk.style.layers.PropertyFactory.iconIgnorePlacement;
import static com.mapbox.mapboxsdk.style.layers.PropertyFactory.iconImage;
import static com.mapbox.mapboxsdk.style.layers.PropertyFactory.iconOffset;
import static com.mapbox.mapboxsdk.style.layers.PropertyFactory.iconSize;
import static com.mapbox.mapboxsdk.style.layers.PropertyFactory.lineCap;
import static com.mapbox.mapboxsdk.style.layers.PropertyFactory.lineGradient;
import static com.mapbox.mapboxsdk.style.layers.PropertyFactory.lineJoin;
import static com.mapbox.mapboxsdk.style.layers.PropertyFactory.lineWidth;

public class OrderDetailActivity extends AppCompatActivity implements OnMapReadyCallback {

    @BindView(R.id.bottom_sheet)
    LinearLayout bottomsheet;
    @BindView(R.id.layanan)
    TextView layanan;
    @BindView(R.id.layanandes)
    TextView layanandesk;
    @BindView(R.id.llchat)
    LinearLayout llchat;
    @BindView(R.id.background)
    CircleImageView photo;
    @BindView(R.id.pickUpText)
    TextView pickUpText;
    @BindView(R.id.destinationText)
    TextView destinationText;
    @BindView(R.id.service)
    TextView fiturtext;
    @BindView(R.id.distance)
    TextView distanceText;
    @BindView(R.id.price)
    TextView priceText;
    @BindView(R.id.namamerchant)
    TextView namamerchant;
    @BindView(R.id.order)
    Button orderButton;
    @BindView(R.id.rlprogress)
    RelativeLayout rlprogress;
    @BindView(R.id.textprogress)
    TextView textprogress;
    @BindView(R.id.phonenumber)
    ImageView phone;
    @BindView(R.id.chat)
    ImageView chat;
    @BindView(R.id.llchatmerchant)
    LinearLayout llchatmerchant;
    @BindView(R.id.lldestination)
    LinearLayout lldestination;
    @BindView(R.id.lldistance)
    LinearLayout lldistance;
    @BindView(R.id.senddetail)
    LinearLayout lldetailsend;
    @BindView(R.id.produk)
    TextView produk;
    @BindView(R.id.sendername)
    TextView sendername;
    @BindView(R.id.receivername)
    TextView receivername;
    @BindView(R.id.senderphone)
    Button senderphone;
    @BindView(R.id.receiverphone)
    Button receiverphone;

    @BindView(R.id.llincash)
    LinearLayout llincash;
    @BindView(R.id.llinwallet)
    LinearLayout llinwallet;
    @BindView(R.id.incash)
    TextView incash;
    @BindView(R.id.inwallet)
    TextView inwallet;

    @BindView(R.id.scroller)
    NestedScrollView scrollView;

    @BindView(R.id.back_btn)
    ImageView backbutton;
    @BindView(R.id.status)
    LinearLayout llrating;
    @BindView(R.id.ratingView)
    RatingView ratingView;
    @BindView(R.id.llbutton)
    LinearLayout llbutton;

    @BindView(R.id.cost)
    TextView cost;
    @BindView(R.id.deliveryfee)
    TextView deliveryfee;
    @BindView(R.id.orderdetail)
    LinearLayout llorderdetail;
    @BindView(R.id.merchantdetail)
    LinearLayout llmerchantdetail;
    @BindView(R.id.merchantinfo)
    LinearLayout llmerchantinfo;
    @BindView(R.id.shimmerlayanan)
    ShimmerFrameLayout shimmerlayanan;
    @BindView(R.id.shimmerpickup)
    ShimmerFrameLayout shimmerpickup;
    @BindView(R.id.shimmerdestination)
    ShimmerFrameLayout shimmerdestination;
    @BindView(R.id.shimmerfitur)
    ShimmerFrameLayout shimmerfitur;
    @BindView(R.id.shimmerdistance)
    ShimmerFrameLayout shimmerdistance;
    @BindView(R.id.shimmerprice)
    ShimmerFrameLayout shimmerprice;

    @BindView(R.id.shimmerincash)
    ShimmerFrameLayout shimmerincash;
    @BindView(R.id.shimmerinwallet)
    ShimmerFrameLayout shimmerinwallet;
    @BindView(R.id.currentlocation)
    FloatingActionButton currentLocation;

    @BindView(R.id.merchantnear)
    RecyclerView rvmerchantnear;

    private static final int REQUEST_PERMISSION_LOCATION = 991;
    private static final int REQUEST_PERMISSION_CALL = 992;
    String idtransmain, idpelanggan, response, service,onsubmit,type;
    ItemPesananItem itemPesananItem;
    TextView totaltext;
    MapView mapView;
    ImageButton imdest, impick;

    Point destination, pickup;
    private List<AllTransModel> dataList;
    MapboxMap mapboxMapStart;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail_order);
        ButterKnife.bind(this);
        BottomSheetBehavior behavior = BottomSheetBehavior.from(bottomsheet);
        behavior.setState(BottomSheetBehavior.STATE_EXPANDED);
        behavior.setPeekHeight(300);
        llrating.setVisibility(View.VISIBLE);
        backbutton.setVisibility(View.VISIBLE);
        llchat.setVisibility(View.GONE);
        llchatmerchant.setVisibility(View.GONE);
        totaltext = findViewById(R.id.totaltext);
        currentLocation.setVisibility(View.GONE);
        type = "0";
        backbutton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });

        rvmerchantnear.setHasFixedSize(true);
        rvmerchantnear.setNestedScrollingEnabled(false);
        rvmerchantnear.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));

        Intent intent = getIntent();
        idpelanggan = intent.getStringExtra("customer_id");
        idtransmain = intent.getStringExtra("transaction_id");
        response = intent.getStringExtra("response");
        mapView = findViewById(R.id.mapView);

        imdest = findViewById(R.id.directiondest);
        impick = findViewById(R.id.directionpick);

        mapView.onCreate(savedInstanceState);
        mapView.getMapAsync(this);
        shimmerload();
        impick.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String uri = String.format(Locale.ENGLISH, "http://maps.google.com/maps?daddr=" +
                                transaksi.getAgent1_latitude() + "," + transaksi.getAgent1_longitude(),
                        12f, 2f, "" + transaksi.getAgent1_customer_fullname());
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
                intent.setPackage("com.google.android.apps.maps");
                try {
                    startActivity(intent);
                } catch (ActivityNotFoundException ex) {
                    try {
                        Intent unrestrictedIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
                        startActivity(unrestrictedIntent);
                    } catch (ActivityNotFoundException innerEx) {
                        Toast.makeText(OrderDetailActivity.this, "Please install a map application", Toast.LENGTH_LONG).show();
                    }
                }
            }
        });
        imdest.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String uri = String.format(Locale.ENGLISH, "http://maps.google.com/maps?daddr=" +
                                transaksi.getAgent2_latitude() + "," + transaksi.getAgent2_longitude(),
                        12f, 2f, "" + transaksi.getAgent2_customer_fullname());
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
                intent.setPackage("com.google.android.apps.maps");
                try {
                    startActivity(intent);
                } catch (ActivityNotFoundException ex) {
                    try {
                        Intent unrestrictedIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
                        startActivity(unrestrictedIntent);
                    } catch (ActivityNotFoundException innerEx) {
                        Toast.makeText(OrderDetailActivity.this, "Please install a map application", Toast.LENGTH_LONG).show();
                    }
                }
            }
        });
        if (Objects.equals(response, "1")) {
            llchat.setVisibility(View.VISIBLE);
            layanandesk.setText(getString(R.string.fresh_order));
            llbutton.setVisibility(View.VISIBLE);
            orderButton.setVisibility(View.VISIBLE);
            orderButton.setText(getString(R.string.accept));
            orderButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    android.app.AlertDialog.Builder alert = new android.app.AlertDialog.Builder(OrderDetailActivity.this, R.style.DialogStyle);
                    alert.setTitle(R.string.app_name)
                            .setIcon(R.mipmap.ic_launcher)
                            .setMessage("Are you sure to accept this order?\nOrder cant be cancelled after accept.")
                            .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog, int id) {
                                    getaccept();
                                }
                            })
                            .setNegativeButton("No", new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog, int id) {
                                    finish();
                                }
                            });
                    alert.setCancelable(false);
                    alert.show();
                }
            });
        } else if (Objects.equals(response, "2")) {
            onsubmit = "2";
            llchat.setVisibility(View.VISIBLE);
            llbutton.setVisibility(View.VISIBLE);
            layanandesk.setText(getString(R.string.notification_accept));
        } else if (Objects.equals(response, "3")) {
            onsubmit = "3";
            llchat.setVisibility(View.VISIBLE);
            orderButton.setVisibility(View.VISIBLE);
            llbutton.setVisibility(View.VISIBLE);
            layanandesk.setText(getString(R.string.notification_start));
        } else if (Objects.equals(response, "4")) {
            scrollView.setPadding(0, 0, 0, 10);
            llchat.setVisibility(View.GONE);
            llbutton.setVisibility(View.GONE);
            orderButton.setVisibility(View.GONE);
            layanandesk.setText(getString(R.string.notification_finish));
        } else if (Objects.equals(response, "5")) {
            scrollView.setPadding(0, 0, 0, 10);
            llchat.setVisibility(View.GONE);
            orderButton.setVisibility(View.GONE);
            llbutton.setVisibility(View.GONE);
            layanandesk.setText(getString(R.string.notification_cancel));
        }
    }

    private void getaccept() {
        rlprogress.setVisibility(View.VISIBLE);
        final User loginUser = BaseApp.getInstance(this).getLoginUser();
        DriverService userService = ServiceGenerator.createService(
                DriverService.class, loginUser.getNoTelepon(), loginUser.getPassword());
        AcceptRequestJson param = new AcceptRequestJson();
        param.setId(loginUser.getId());
        param.setIdtrans(idtransmain);
        userService.accept(param).enqueue(new Callback<AcceptResponseJson>() {
            @Override
            public void onResponse(@NonNull Call<AcceptResponseJson> call, @NonNull final Response<AcceptResponseJson> response) {
                if (response.isSuccessful()) {
                    if (Objects.requireNonNull(response.body()).getMessage().equalsIgnoreCase("berhasil")) {
                        rlprogress.setVisibility(View.GONE);
//                        Intent i = new Intent(OrderDetailActivity.this, MainActivity.class);
//                        i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | FLAG_ACTIVITY_NEW_TASK);
//                        startActivity(i);
                        finish();
                        OrderFCM orderfcm = new OrderFCM();
                        orderfcm.driver_id = loginUser.getId();
                        orderfcm.transaction_id = idtransmain;
                        orderfcm.response = "2";
                    } else {
                        rlprogress.setVisibility(View.GONE);
                        finish();
//                        Intent i = new Intent(OrderDetailActivity.this, MainActivity.class);
//                        i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | FLAG_ACTIVITY_NEW_TASK);
//                        startActivity(i);
                        Toast.makeText(OrderDetailActivity.this, "Order is no longer available!", Toast.LENGTH_SHORT).show();
                    }
                }
            }

            @Override
            public void onFailure(@NonNull Call<AcceptResponseJson> call, @NonNull Throwable t) {
                Toast.makeText(OrderDetailActivity.this, "Error Connection!", Toast.LENGTH_SHORT).show();
                rlprogress.setVisibility(View.GONE);
                rlprogress.setVisibility(View.GONE);
                Intent i = new Intent(OrderDetailActivity.this, MainActivity.class);
                i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | FLAG_ACTIVITY_NEW_TASK);
                startActivity(i);

            }
        });
    }

    Style style1;

    @Override
    public void onMapReady(@NonNull final MapboxMap mapboxMap) {
        mapboxMap.setStyle(new Style.Builder().fromUri(Style.LIGHT)
                .withImage("ORIGIN_ICON_ID", Objects.requireNonNull(BitmapUtils.getBitmapFromDrawable(
                        getResources().getDrawable(R.drawable.ic_pickup_map))))
                .withImage("DESTINATION_ICON_ID", Objects.requireNonNull(BitmapUtils.getBitmapFromDrawable(
                        getResources().getDrawable(R.drawable.ic_destination_map)))), new Style.OnStyleLoaded() {
            @Override
            public void onStyleLoaded(@NonNull final Style style) {

                UiSettings uiSettings = mapboxMap.getUiSettings();
                uiSettings.setCompassEnabled(false);
                uiSettings.setAttributionEnabled(false);
                uiSettings.setLogoEnabled(false);
                mapboxMapStart = mapboxMap;
                style1 = style;
                getaccepteddatatrans();
                getData(idtransmain, idpelanggan, style, mapboxMap);
            }
        });
    }

    TransModel transaksi;

    private void getData(final String idtrans, final String idpelanggan, Style style, MapboxMap mapboxMap) {
        shimmerload();
        User loginUser = BaseApp.getInstance(this).getLoginUser();
        DriverService services = ServiceGenerator.createService(DriverService.class, loginUser.getEmail(), loginUser.getPassword());
        DetailRequestJson param = new DetailRequestJson();
        param.setId(idtrans);
        idtransmain = idtrans;
        param.setIdPelanggan(idpelanggan);
        services.detailtrans(param).enqueue(new Callback<DetailTransResponseJson>() {
            @Override
            public void onResponse(@NonNull Call<DetailTransResponseJson> call, @NonNull Response<DetailTransResponseJson> responsedata) {
                if (responsedata.isSuccessful()) {
                    shimmertutup();
                    try {
                        transaksi = responsedata.body().getData().get(0);
                        response = String.valueOf(transaksi.status);
                        CustomerModel pelanggan = responsedata.body().getPelanggan().get(0);

                        switch (response) {
                            case "1":
                                onsubmit = "1";
                                llchat.setVisibility(View.VISIBLE);
                                layanandesk.setText(getString(R.string.fresh_order));
                                llbutton.setVisibility(View.VISIBLE);
                                orderButton.setVisibility(View.VISIBLE);
                                orderButton.setText(getString(R.string.accept));
                                orderButton.setOnClickListener(new View.OnClickListener() {
                                    @Override
                                    public void onClick(View v) {
                                        AlertDialog.Builder alert = new AlertDialog.Builder(OrderDetailActivity.this, R.style.DialogStyle);
                                        alert.setTitle(R.string.app_name)
                                                .setIcon(R.mipmap.ic_launcher)
                                                .setMessage("Are you sure to accept this order?\nOrder cant be cancelled after accept.")
                                                .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                                                    public void onClick(DialogInterface dialog, int id) {
                                                        getaccept();
                                                    }
                                                })
                                                .setNegativeButton("No", new DialogInterface.OnClickListener() {
                                                    public void onClick(DialogInterface dialog, int id) {
                                                        getaccepteddatatrans();
                                                    }
                                                });
                                        alert.setCancelable(false);
                                        alert.show();
                                    }
                                });
                                break;
                            case "2":
                                onsubmit = "2";
                                llchat.setVisibility(View.VISIBLE);
                                layanandesk.setText(getString(R.string.notification_accept));
                                orderButton.setVisibility(View.VISIBLE);
                                llbutton.setVisibility(View.VISIBLE);
                                orderButton.setText("start");
                                orderButton.setOnClickListener(new View.OnClickListener() {
                                    @Override
                                    public void onClick(View view) {

                                        start(pelanggan, transaksi.getToken_merchant(), transaksi.idtransmerchant, String.valueOf(transaksi.getWaktuOrder()),
                                                style, mapboxMap);

                                    }
                                });
                                break;
                            case "3":
                                onsubmit = "3";
                                llchat.setVisibility(View.VISIBLE);
                                orderButton.setVisibility(View.VISIBLE);
                                llbutton.setVisibility(View.VISIBLE);
                                layanandesk.setText(getString(R.string.notification_start));
                                orderButton.setText("Finish");
                                orderButton.setOnClickListener(new View.OnClickListener() {
                                    @Override
                                    public void onClick(View view) {
                                        finish(pelanggan, transaksi.merchant_token);
                                    }
                                });
                                break;
                            case "4":
                                scrollView.setPadding(0, 0, 0, 10);
                                llchat.setVisibility(View.GONE);
                                orderButton.setVisibility(View.GONE);
                                llbutton.setVisibility(View.GONE);
                                layanandesk.setText(getString(R.string.notification_finish));
                                break;
                            case "5":
                                scrollView.setPadding(0, 0, 0, 10);
                                llchat.setVisibility(View.GONE);
                                llbutton.setVisibility(View.GONE);
                                orderButton.setVisibility(View.GONE);
                                layanandesk.setText(getString(R.string.notification_cancel));
                                break;
                        }
                        String formatdistance = String.format(Locale.US, "%.1f", transaksi.getJarak());
                        distanceText.setText(formatdistance);
                        fiturtext.setText(transaksi.getEstimasi());
                        CameraPosition position = new CameraPosition.Builder()
                                .target(new LatLng(transaksi.getAgent2_latitude(), transaksi.getAgent2_longitude()))
                                .zoom(10)
                                .tilt(20)
                                .build();
                        mapboxMap.animateCamera(CameraUpdateFactory.newCameraPosition(position), 100);
                        service = transaksi.getOrderFitur();
                        type = transaksi.getHome();
                        switch (transaksi.getHome()) {
                            case "3":
                                lldestination.setVisibility(View.GONE);
                                lldistance.setVisibility(View.GONE);
                                fiturtext.setText(transaksi.getEstimasi());
                                break;
                            case "4":
                                llorderdetail.setVisibility(View.VISIBLE);
                                llmerchantdetail.setVisibility(View.VISIBLE);
                                llmerchantinfo.setVisibility(View.VISIBLE);
                                Utility.currencyTXT(deliveryfee, String.valueOf(transaksi.getHarga()), OrderDetailActivity.this);
                                Utility.currencyTXT(cost, String.valueOf(transaksi.getTotal_biaya()), OrderDetailActivity.this);
                                namamerchant.setText(transaksi.getNama_merchant());

                                itemPesananItem = new ItemPesananItem(responsedata.body().getItem(), R.layout.item_pesanan);
                                rvmerchantnear.setAdapter(itemPesananItem);
                                break;
                            case "2":
                                lldetailsend.setVisibility(View.VISIBLE);
                                produk.setText(transaksi.getNamaBarang());
                                sendername.setText(transaksi.getAgent1_customer_fullname());
                                receivername.setText(transaksi.getAgent2_customer_fullname());

                                senderphone.setOnClickListener(new View.OnClickListener() {
                                    @Override
                                    public void onClick(View v) {
                                        final AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(OrderDetailActivity.this, R.style.DialogStyle);
                                        alertDialogBuilder.setTitle("Call Driver");
                                        alertDialogBuilder.setMessage("You want to call " + transaksi.getAgent1_customer_fullname() +
                                                "(" + transaksi.getAgent1_phone_number() + ")?");
                                        alertDialogBuilder.setPositiveButton("yes",
                                                new DialogInterface.OnClickListener() {
                                                    @Override
                                                    public void onClick(DialogInterface arg0, int arg1) {
                                                        if (ActivityCompat.checkSelfPermission(OrderDetailActivity.this, Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
                                                            ActivityCompat.requestPermissions(OrderDetailActivity.this, new String[]{Manifest.permission.CALL_PHONE}, REQUEST_PERMISSION_CALL);
                                                            return;
                                                        }

                                                        Intent callIntent = new Intent(Intent.ACTION_CALL);
                                                        callIntent.setData(Uri.parse("tel:" + transaksi.getAgent1_phone_number()));
                                                        startActivity(callIntent);
                                                    }
                                                });

                                        alertDialogBuilder.setNegativeButton("No", new DialogInterface.OnClickListener() {
                                            @Override
                                            public void onClick(DialogInterface dialog, int which) {
                                                dialog.dismiss();
                                            }
                                        });

                                        AlertDialog alertDialog = alertDialogBuilder.create();
                                        alertDialog.show();


                                    }
                                });

                                receiverphone.setOnClickListener(new View.OnClickListener() {
                                    @Override
                                    public void onClick(View v) {
                                        final AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(OrderDetailActivity.this, R.style.DialogStyle);
                                        alertDialogBuilder.setTitle("Call Driver");
                                        alertDialogBuilder.setMessage("You want to call " + transaksi.getAgent2_customer_fullname()
                                                + "(" + transaksi.getAgent2_phone_number() + ")?");
                                        alertDialogBuilder.setPositiveButton("yes",
                                                new DialogInterface.OnClickListener() {
                                                    @Override
                                                    public void onClick(DialogInterface arg0, int arg1) {
                                                        if (ActivityCompat.checkSelfPermission(OrderDetailActivity.this, Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
                                                            ActivityCompat.requestPermissions(OrderDetailActivity.this, new String[]{Manifest.permission.CALL_PHONE}, REQUEST_PERMISSION_CALL);
                                                            return;
                                                        }

                                                        Intent callIntent = new Intent(Intent.ACTION_CALL);
                                                        callIntent.setData(Uri.parse("tel:" + transaksi.getAgent2_phone_number()));
                                                        startActivity(callIntent);
                                                    }
                                                });

                                        alertDialogBuilder.setNegativeButton("No", new DialogInterface.OnClickListener() {
                                            @Override
                                            public void onClick(DialogInterface dialog, int which) {
                                                dialog.dismiss();
                                            }
                                        });

                                        AlertDialog alertDialog = alertDialogBuilder.create();
                                        alertDialog.show();


                                    }
                                });

                                break;

                        }


                        if (Objects.equals(response, "1")) {
                            destination = Point.fromLngLat(transaksi.getAgent2_longitude(), transaksi.getAgent2_latitude());
                            lldetailsend.setVisibility(View.VISIBLE);
                            produk.setText(transaksi.getService());
                            sendername.setText(transaksi.getAgent1_customer_fullname());
                            receivername.setText(transaksi.getAgent2_customer_fullname());

                            senderphone.setOnClickListener(new View.OnClickListener() {
                                @Override
                                public void onClick(View v) {
                                    final AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(OrderDetailActivity.this, R.style.DialogStyle);
                                    alertDialogBuilder.setTitle("Call Driver");
                                    alertDialogBuilder.setMessage("You want to call " + transaksi.getAgent1_customer_fullname()
                                            + "(" + transaksi.getAgent1_phone_number() + ")?");
                                    alertDialogBuilder.setPositiveButton("yes",
                                            new DialogInterface.OnClickListener() {
                                                @Override
                                                public void onClick(DialogInterface arg0, int arg1) {
                                                    if (ActivityCompat.checkSelfPermission(OrderDetailActivity.this, Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
                                                        ActivityCompat.requestPermissions(OrderDetailActivity.this, new String[]{Manifest.permission.CALL_PHONE}, REQUEST_PERMISSION_CALL);
                                                        return;
                                                    }

                                                    Intent callIntent = new Intent(Intent.ACTION_CALL);
                                                    callIntent.setData(Uri.parse("tel:" + transaksi.getAgent1_phone_number()));
                                                    startActivity(callIntent);
                                                }
                                            });

                                    alertDialogBuilder.setNegativeButton("No", new DialogInterface.OnClickListener() {
                                        @Override
                                        public void onClick(DialogInterface dialog, int which) {
                                            dialog.dismiss();
                                        }
                                    });

                                    AlertDialog alertDialog = alertDialogBuilder.create();
                                    alertDialog.show();


                                }
                            });

                            receiverphone.setOnClickListener(new View.OnClickListener() {
                                @Override
                                public void onClick(View v) {
                                    final AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(OrderDetailActivity.this, R.style.DialogStyle);
                                    alertDialogBuilder.setTitle("Call Agent");
                                    alertDialogBuilder.setMessage("You want to call " + transaksi.getAgent2_customer_fullname() + "(" + transaksi.getAgent2_phone_number() + ")?");
                                    alertDialogBuilder.setPositiveButton("yes",
                                            new DialogInterface.OnClickListener() {
                                                @Override
                                                public void onClick(DialogInterface arg0, int arg1) {
                                                    if (ActivityCompat.checkSelfPermission(OrderDetailActivity.this, Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
                                                        ActivityCompat.requestPermissions(OrderDetailActivity.this, new String[]{Manifest.permission.CALL_PHONE}, REQUEST_PERMISSION_CALL);
                                                        return;
                                                    }

                                                    Intent callIntent = new Intent(Intent.ACTION_CALL);
                                                    callIntent.setData(Uri.parse("tel:" + transaksi.getAgent2_phone_number()));
                                                    startActivity(callIntent);
                                                }
                                            });

                                    alertDialogBuilder.setNegativeButton("No", new DialogInterface.OnClickListener() {
                                        @Override
                                        public void onClick(DialogInterface dialog, int which) {
                                            dialog.dismiss();
                                        }
                                    });

                                    AlertDialog alertDialog = alertDialogBuilder.create();
                                    alertDialog.show();


                                }
                            });
                        } else {
                            destination = Point.fromLngLat(transaksi.getAgent2_longitude(), transaksi.getAgent2_latitude());
                        }
                        pickup = Point.fromLngLat(transaksi.getAgent1_longitude(), transaksi.getAgent1_longitude());
                        try {
                            initSources(style1, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID");
                            initLayers(style1, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID", "DROUTE_LAYER_ID", "DICON_LAYER_ID");
                        } catch (Exception e) {
                        }
                        getRoute(mapboxMapStart, pickup, destination, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID");
                        parsedata(transaksi, pelanggan);
                    } catch (NullPointerException e) {

                    } catch (Exception e) {

                    }
                }
            }

            @Override
            public void onFailure(@NonNull retrofit2.Call<DetailTransResponseJson> call, @NonNull Throwable t) {

            }
        });


    }

    private void initSources(@NonNull Style loadedMapStyle, String lineid, String iconsourceid) {
        try {
            if (mapboxMapStart.getStyle().getSource(lineid) == null) {
                loadedMapStyle.addSource(new GeoJsonSource(lineid, new GeoJsonOptions().withLineMetrics(true)));
                loadedMapStyle.addSource(new GeoJsonSource(iconsourceid, getOriginAndDestinationFeatureCollection()));
            }
        } catch (CannotAddSourceException e) {
        } catch (NullPointerException e) {
        } catch (Exception e) {
        }

    }

    private void initLayers(@NonNull Style loadedMapStyle, String lineid, String iconsourceid, String routeid, String iconlayerid) {
        try {
            if (mapboxMapStart.getStyle().getLayer(lineid) == null) {
                loadedMapStyle.addLayer(new LineLayer(routeid, lineid).withProperties(
                        lineCap(Property.LINE_CAP_ROUND),
                        lineJoin(Property.LINE_JOIN_ROUND),
                        lineWidth(6f),
                        lineGradient(interpolate(
                                linear(), lineProgress(),
                                stop(0f, color(getResources().getColor(R.color.colorPrimary))),
                                stop(1f, color(getResources().getColor(R.color.colorgradient))
                                )))));

                loadedMapStyle.addLayer(new SymbolLayer(iconlayerid, iconsourceid).withProperties(
                        iconImage(match(get("originDestination"), literal("origin"),
                                stop("origin", "ORIGIN_ICON_ID"),
                                stop("destination", "DESTINATION_ICON_ID"))),
                        iconIgnorePlacement(true),
                        iconAllowOverlap(true),
                        iconSize(2.0f),
                        iconOffset(new Float[]{0f, -4f})));
            }
        } catch (CannotAddLayerException e) {
        } catch (NullPointerException e) {
        } catch (Exception e) {
        }
    }

    MapboxDirections.Builder client;
    private DirectionsRoute currentRoute;

    private void getaccepteddatatrans() {
        rlprogress.setVisibility(View.VISIBLE);

        try {
            User loginUser = BaseApp.getInstance(getApplicationContext()).getLoginUser();
            DriverService driverService = ServiceGenerator.createService(
                    DriverService.class, loginUser.getNoTelepon(), loginUser.getPassword());
            FreshDetailRequestJson param = new FreshDetailRequestJson();
            param.setDriver_id(loginUser.getId());

            driverService.acptorder(param).enqueue(new Callback<AllTransResponseJson>() {
                @Override
                public void onResponse(@NonNull Call<AllTransResponseJson> call, @NonNull Response<AllTransResponseJson> response) {
                    rlprogress.setVisibility(View.GONE);

                    if (response.isSuccessful()) {
                        shimmertutup();
                        dataList = Objects.requireNonNull(response.body()).getData();
                    } else {
                        getData(idtransmain,
                                idpelanggan,
                                style1, mapboxMapStart);
                    }

//                    getRoute(mapboxMapStart, pickup, destination, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID");
                }

                @Override
                public void onFailure(@NonNull Call<AllTransResponseJson> call, @NonNull Throwable t) {
                    rlprogress.setVisibility(View.GONE);
                    getData(idtransmain,
                            idpelanggan,
                            style1, mapboxMapStart);
//                    initSources(style1, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID");
//                    initLayers(style1, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID", "DROUTE_LAYER_ID", "DICON_LAYER_ID");
//                    getRoute(mapboxMapStart, pickup, destination, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID");

//                    getRoute(mapboxMapStart, pickup, destination, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID");
                }
            });
        } catch (IllegalStateException e) {
            rlprogress.setVisibility(View.GONE);
            getData(idtransmain,
                    idpelanggan,
                    style1, mapboxMapStart);
//            initSources(style1, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID");
//            initLayers(style1, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID", "DROUTE_LAYER_ID", "DICON_LAYER_ID");
//            getRoute(mapboxMapStart, pickup, destination, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID");

//            getRoute(mapboxMapStart, pickup, destination, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID");

        } catch (Exception e) {
            rlprogress.setVisibility(View.GONE);
            getData(idtransmain,
                    idpelanggan,
                    style1, mapboxMapStart);
//            initSources(style1, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID");
//            initLayers(style1, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID", "DROUTE_LAYER_ID", "DICON_LAYER_ID");
//            getRoute(mapboxMapStart, pickup, destination, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID");

//            getRoute(mapboxMapStart, pickup, destination, "DEST_LINE_SOURCE_ID", "DEST_SOURCE_ID");

        }

    }

    private void sendMessageToDriver(final String regIDTujuan, final OrderFCM response) {

        final FCMMessage message = new FCMMessage();
        message.setTo(regIDTujuan);
        message.setData(response);

        FCMHelper.sendMessage(Constant.FCM_KEY, message).enqueue(new okhttp3.Callback() {
            @Override
            public void onResponse(@NonNull okhttp3.Call call, @NonNull okhttp3.Response response) {
                android.util.Log.e("REQUEST TO DRIVER", message.getData().toString());
            }

            @Override
            public void onFailure(@NonNull okhttp3.Call call, @NonNull IOException e) {
                e.printStackTrace();
            }
        });
    }

    private void start(final CustomerModel pelanggan, final String tokenmerchant, final String idtransmerchant, final String waktuorder, Style style, MapboxMap mapboxMap) {
        rlprogress.setVisibility(View.VISIBLE);
        final User loginUser = BaseApp.getInstance(getApplicationContext()).getLoginUser();
        DriverService userService = ServiceGenerator.createService(
                DriverService.class, loginUser.getNoTelepon(), loginUser.getPassword());
        AcceptRequestJson param = new AcceptRequestJson();
        param.setId(loginUser.getId());
        param.setIdtrans(idtransmain);
        userService.startrequest(param).enqueue(new Callback<AcceptResponseJson>() {
            @Override
            public void onResponse(@NonNull Call<AcceptResponseJson> call, @NonNull final Response<AcceptResponseJson> response) {
                if (response.isSuccessful()) {

                    if (Objects.requireNonNull(response.body()).getMessage().equalsIgnoreCase("berhasil")) {
                        rlprogress.setVisibility(View.GONE);
                        onsubmit = "3";
                        getData(idtransmain, idpelanggan, style, mapboxMap);
                        OrderFCM orderfcm = new OrderFCM();
                        orderfcm.driver_id = loginUser.getId();
                        orderfcm.transaction_id = idtransmain;
                        orderfcm.response = "3";
                        if (type.equals("4")) {
                            orderfcm.customer_id = idpelanggan;
                            orderfcm.invoice = "INV-" + idtransmain + idtransmerchant;
                            orderfcm.ordertime = waktuorder;
                            orderfcm.desc = "driver delivers the order";
                            sendMessageToDriver(tokenmerchant, orderfcm);
                        } else {
                            orderfcm.desc = getString(R.string.notification_start);
                        }
                        sendMessageToDriver(pelanggan.getToken(), orderfcm);
                    } else {
                        rlprogress.setVisibility(View.GONE);
                        Intent i = new Intent(getApplicationContext(), MainActivity.class);
                        i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | FLAG_ACTIVITY_NEW_TASK);
                        startActivity(i);
                        Toast.makeText(getApplicationContext(), "Order is no longer available!", Toast.LENGTH_SHORT).show();
                    }
                }
            }

            @Override
            public void onFailure(@NonNull Call<AcceptResponseJson> call, @NonNull Throwable t) {
                Toast.makeText(getApplicationContext(), "Error Connection!", Toast.LENGTH_SHORT).show();
                rlprogress.setVisibility(View.GONE);
            }
        });
    }

    private void verify(String verificode, final CustomerModel pelanggan, final String tokenmerchant, final String idtransmerchant, final String waktuorder, Style style, MapboxMap mapboxMap) {
        rlprogress.setVisibility(View.VISIBLE);
        final User loginUser = BaseApp.getInstance(getApplicationContext()).getLoginUser();
        DriverService userService = ServiceGenerator.createService(
                DriverService.class, loginUser.getNoTelepon(), loginUser.getPassword());
        VerifyRequestJson param = new VerifyRequestJson();
        param.setId(loginUser.getNoTelepon());
        param.setIdtrans(idtransmain);
        param.setVerifycode(verificode);
        userService.verifycode(param).enqueue(new Callback<ResponseJson>() {
            @Override
            public void onResponse(@NonNull Call<ResponseJson> call, @NonNull final Response<ResponseJson> response) {
                if (response.isSuccessful()) {

                    if (Objects.requireNonNull(response.body()).getMessage().equalsIgnoreCase("success")) {

                        start(pelanggan, tokenmerchant, idtransmerchant, waktuorder, style, mapboxMap);
                    } else {
                        rlprogress.setVisibility(View.GONE);
                        Toast.makeText(getApplicationContext(), "verifycode not correct!", Toast.LENGTH_SHORT).show();
                    }
                }
            }

            @Override
            public void onFailure(@NonNull Call<ResponseJson> call, @NonNull Throwable t) {
                Toast.makeText(getApplicationContext(), "Error Connection!", Toast.LENGTH_SHORT).show();
                rlprogress.setVisibility(View.GONE);
            }
        });
    }

    private void finish(final CustomerModel pelanggan, final String tokenmerchant) {
        rlprogress.setVisibility(View.VISIBLE);
        final User loginUser = BaseApp.getInstance(getApplicationContext()).getLoginUser();
        DriverService userService = ServiceGenerator.createService(
                DriverService.class, loginUser.getNoTelepon(), loginUser.getPassword());
        AcceptRequestJson param = new AcceptRequestJson();
        param.setId(loginUser.getId());
        param.setIdtrans(idtransmain);
        userService.finishrequest(param).enqueue(new Callback<AcceptResponseJson>() {
            @Override
            public void onResponse(@NonNull Call<AcceptResponseJson> call, @NonNull final Response<AcceptResponseJson> response) {
                if (response.isSuccessful()) {

                    if (Objects.requireNonNull(response.body()).getMessage().equalsIgnoreCase("berhasil")) {
                        rlprogress.setVisibility(View.GONE);
                        Intent i = new Intent(getApplicationContext(), MainActivity.class);
                        i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | FLAG_ACTIVITY_NEW_TASK);
                        startActivity(i);
                        OrderFCM orderfcm = new OrderFCM();
                        orderfcm.driver_id = loginUser.getId();
                        orderfcm.transaction_id = idtransmain;
                        orderfcm.response = "4";
                        orderfcm.desc = getString(R.string.notification_finish);
                        if (type.equals("4")) {
                            sendMessageToDriver(tokenmerchant, orderfcm);
                            sendMessageToDriver(pelanggan.getToken(), orderfcm);
                        } else {
                            sendMessageToDriver(pelanggan.getToken(), orderfcm);
                        }

                    } else {
                        rlprogress.setVisibility(View.GONE);
                        Intent i = new Intent(getApplicationContext(), MainActivity.class);
                        i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | FLAG_ACTIVITY_NEW_TASK);
                        startActivity(i);
                        Toast.makeText(getApplicationContext(), "Order is no longer available!", Toast.LENGTH_SHORT).show();
                    }
                }
            }

            @Override
            public void onFailure(@NonNull Call<AcceptResponseJson> call, @NonNull Throwable t) {
                Toast.makeText(getApplicationContext(), "Error Connection!", Toast.LENGTH_SHORT).show();
                rlprogress.setVisibility(View.GONE);
            }
        });
    }

    private void getRoute(MapboxMap mapboxMap, Point origin, Point destination, String lineid, String iconsourceid) {
        client = MapboxDirections.builder()
                .origin(origin)
                .destination(destination)
                .overview(DirectionsCriteria.OVERVIEW_FULL)
                .profile(DirectionsCriteria.PROFILE_DRIVING)
                .accessToken(getString(R.string.mapbox_access_token));

        try {
            for (int q = 0; q < dataList.size(); q++) {
                Point point = Point.fromLngLat(dataList.get(q).getStartLongitude(), dataList.get(q).getStartLatitude());
                client.addWaypoint(point);
                mapboxMapStart.addMarker(new MarkerOptions().position(new LatLng(dataList.get(q).getStartLatitude(), dataList.get(q).getStartLongitude()))
                        .setTitle("Pick up point : " + dataList.get(q).getAlamatAsal()).setSnippet("" + q).setIcon(IconFactory.getInstance(getApplicationContext()).fromResource(R.drawable.ic_pickup_maps)));

                Point pointend = Point.fromLngLat(dataList.get(q).getEndLongitude(), dataList.get(q).getEndLatitude());
                client.addWaypoint(pointend);
                mapboxMapStart.addMarker(new MarkerOptions().position(new LatLng(dataList.get(q).getEndLatitude(), dataList.get(q).getEndLongitude()))
                        .setTitle("Destination point : " + dataList.get(q).getAlamatTujuan()).setSnippet("" + q).setIcon(IconFactory.getInstance(getApplicationContext()).fromResource(R.drawable.ic_destination_maps)));

                mapboxMapStart.setOnMarkerClickListener(new MapboxMap.OnMarkerClickListener() {
                    @Override
                    public boolean onMarkerClick(@NonNull Marker marker) {
                        android.util.Log.d("marker", "" + marker.getPosition());
                        android.util.Log.d("marker", "" + marker.getId());
                        android.util.Log.d("marker getSnippet", "" + marker.getSnippet());
                        android.util.Log.d("marker getIdPelanggan", "" + dataList.get(Integer.parseInt(marker.getSnippet())).getIdPelanggan());
                        Log.d("marker getId", "" + dataList.get(Integer.parseInt(marker.getSnippet())).getIdTransaksi());

                        getData(dataList.get(Integer.parseInt(marker.getSnippet())).getIdTransaksi(),
                                dataList.get(Integer.parseInt(marker.getSnippet())).getIdPelanggan(),
                                style1, mapboxMapStart);
                        return false;
                    }
                });
            }
        } catch (NullPointerException e) {
        } catch (ArrayIndexOutOfBoundsException e) {
        } catch (Exception e) {
        }


        client.build()
                .enqueueCall(new Callback<DirectionsResponse>() {
                    @Override
                    public void onResponse(Call<DirectionsResponse> call, Response<DirectionsResponse> response) {
                        if (response.body() == null) {
                            return;
                        } else if (response.body().routes().size() < 1) {
                            return;
                        }

                        currentRoute = response.body().routes().get(0);

                        if (currentRoute != null) {
                            if (mapboxMap != null) {
                                mapboxMap.getStyle(new Style.OnStyleLoaded() {
                                    @Override
                                    public void onStyleLoaded(@NonNull Style style) {
                                        GeoJsonSource originDestinationPointGeoJsonSource = style.getSourceAs(iconsourceid);

                                        if (originDestinationPointGeoJsonSource != null) {
                                            originDestinationPointGeoJsonSource.setGeoJson(getOriginAndDestinationFeatureCollection());
                                        }
                                        GeoJsonSource lineLayerRouteGeoJsonSource = style.getSourceAs(lineid);

                                        if (lineLayerRouteGeoJsonSource != null) {
                                            LineString lineString = LineString.fromPolyline(Objects.requireNonNull(currentRoute.geometry()), PRECISION_6);
                                            lineLayerRouteGeoJsonSource.setGeoJson(Feature.fromGeometry(lineString));
                                        }
                                    }
                                });
                            }
                        } else {
                            Timber.d("Directions route is null");
                        }
                    }

                    @Override
                    public void onFailure(Call<DirectionsResponse> call, Throwable throwable) {
                    }
                });
    }

    private FeatureCollection getOriginAndDestinationFeatureCollection() {
        Feature origin = Feature.fromGeometry(pickup);
        origin.addStringProperty("originDestination", "origin");
        Feature destinationFeature = Feature.fromGeometry(destination);
        destinationFeature.addStringProperty("originDestination", "destination");
        return FeatureCollection.fromFeatures(new Feature[]{origin, destinationFeature});
    }

    private void shimmerload() {
        shimmerlayanan.startShimmerAnimation();
        shimmerpickup.startShimmerAnimation();
        shimmerdestination.startShimmerAnimation();
        shimmerfitur.startShimmerAnimation();
        shimmerdistance.startShimmerAnimation();
        shimmerprice.startShimmerAnimation();
        shimmerincash.startShimmerAnimation();
        shimmerinwallet.startShimmerAnimation();

        layanan.setVisibility(View.GONE);
        layanandesk.setVisibility(View.GONE);
        pickUpText.setVisibility(View.GONE);
        impick.setVisibility(View.GONE);
        imdest.setVisibility(View.GONE);
        destinationText.setVisibility(View.GONE);
        fiturtext.setVisibility(View.GONE);
        priceText.setVisibility(View.GONE);
        incash.setVisibility(View.GONE);
        inwallet.setVisibility(View.GONE);
    }

    private void shimmertutup() {
        shimmerlayanan.stopShimmerAnimation();
        shimmerpickup.stopShimmerAnimation();
        shimmerdestination.stopShimmerAnimation();
        shimmerfitur.stopShimmerAnimation();
        shimmerdistance.stopShimmerAnimation();
        shimmerprice.stopShimmerAnimation();
        shimmerincash.stopShimmerAnimation();
        shimmerinwallet.stopShimmerAnimation();

        shimmerlayanan.setVisibility(View.GONE);
        shimmerpickup.setVisibility(View.GONE);
        shimmerdestination.setVisibility(View.GONE);
        shimmerfitur.setVisibility(View.GONE);
        shimmerdistance.setVisibility(View.GONE);
        shimmerprice.setVisibility(View.GONE);
        shimmerincash.setVisibility(View.GONE);
        shimmerinwallet.setVisibility(View.GONE);

        impick.setVisibility(View.VISIBLE);
        imdest.setVisibility(View.VISIBLE);
        layanan.setVisibility(View.VISIBLE);
        layanandesk.setVisibility(View.VISIBLE);
        pickUpText.setVisibility(View.VISIBLE);
        destinationText.setVisibility(View.VISIBLE);
        distanceText.setVisibility(View.VISIBLE);
        fiturtext.setVisibility(View.VISIBLE);
        priceText.setVisibility(View.VISIBLE);
        /*
        incash.setVisibility(View.VISIBLE);
        inwallet.setVisibility(View.VISIBLE);
         */


        // New code change on 2/08/22
        incash.setVisibility(View.GONE);
        inwallet.setVisibility(View.GONE);



    }

    @SuppressLint("SetTextI18n")
    private void parsedata(TransModel request, final CustomerModel pelanggan) {
        rlprogress.setVisibility(View.GONE);

        PicassoTrustAll.getInstance(this)
                .load(Constant.IMAGESUSER + pelanggan.getFoto())
                .placeholder(R.drawable.image_placeholder)
                .into(photo);

        if (request.isPakaiWallet()) {
            Utility.currencyTXT(incash, "0", this);
            Utility.currencyTXT(inwallet, String.valueOf(request.getHarga()), this);
        } else {
            Utility.currencyTXT(inwallet, request.getKreditPromo(), this);
            Utility.currencyTXT(incash, request.getBiaya_akhir(), this);
        }

        if (!request.getRate().isEmpty()) {
            ratingView.setRating(Float.parseFloat(request.getRate()));
        }

        layanan.setText(pelanggan.getFullnama());
        pickUpText.setText(request.getAgent1_address());
        destinationText.setText(request.getAgent2_address());
        if (request.getHome().equals("4")) {
            double totalbiaya = Double.parseDouble(request.getTotal_biaya());
            Utility.currencyTXT(priceText, String.valueOf((request.getHarga() + totalbiaya)), this);
        } else {
            Utility.currencyTXT(priceText, String.valueOf(request.getHarga()), this);
        }

    }
}
