package com.slog.agentassignment.activity;

import static com.slog.agentassignment.json.fcm.FCMType.ORDER;

import android.Manifest;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.core.content.FileProvider;
import androidx.exifinterface.media.ExifInterface;

import com.mapbox.api.directions.v5.DirectionsCriteria;
import com.mapbox.api.directions.v5.MapboxDirections;
import com.mapbox.api.directions.v5.models.DirectionsResponse;
import com.mapbox.api.directions.v5.models.DirectionsRoute;
import com.mapbox.geojson.Point;
import com.mapbox.mapboxsdk.geometry.LatLng;
import com.razorpay.Checkout;
import com.razorpay.Order;
import com.razorpay.PaymentResultListener;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import com.slog.agentassignment.R;
import com.slog.agentassignment.constants.BaseApp;
import com.slog.agentassignment.constants.Constant;
import com.slog.agentassignment.json.AgentResponseJson;
import com.slog.agentassignment.json.PromoRequestJson;
import com.slog.agentassignment.json.PromoResponseJson;
import com.slog.agentassignment.json.SendRequestJson;
import com.slog.agentassignment.json.SendResponseJson;
import com.slog.agentassignment.json.fcm.DriverRequest;
import com.slog.agentassignment.json.fcm.DriverResponse;
import com.slog.agentassignment.json.fcm.FCMMessage;
import com.slog.agentassignment.models.AgentModel;
import com.slog.agentassignment.models.DriverModel;
import com.slog.agentassignment.models.ServiceModel;
import com.slog.agentassignment.models.TransSendModel;
import com.slog.agentassignment.models.User;
import com.slog.agentassignment.utils.Utility;
import com.slog.agentassignment.utils.api.FCMHelper;
import com.slog.agentassignment.utils.api.ServiceGenerator;
import com.slog.agentassignment.utils.api.service.BookService;
import com.slog.agentassignment.utils.api.service.UserService;
import com.ybs.countrypicker.CountryPicker;
import com.ybs.countrypicker.CountryPickerListener;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

import butterknife.BindView;
import butterknife.ButterKnife;
import io.realm.Realm;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import timber.log.Timber;


/**
 * Created by Ourdevelops Team on 10/26/2019.
 */

public class SendDetailActivity extends AppCompatActivity implements PaymentResultListener {

    @BindView(R.id.back_btn)
    ImageView back_btn;
    @BindView(R.id.dokumen)
    Button dokument;
    @BindView(R.id.fashion)
    Button fashion;
    @BindView(R.id.box)
    Button box;
    @BindView(R.id.other)
    Button other;
    @BindView(R.id.otherdetail)
    EditText othertext;
    @BindView(R.id.countrycode)
    TextView countrycode;
    @BindView(R.id.countrycodereceiver)
    TextView countrycodereceiver;
    @BindView(R.id.distance)
    TextView distanceText;
    @BindView(R.id.price)
    TextView priceText;
    @BindView(R.id.topUp)
    TextView topUp;
    @BindView(R.id.cost)
    TextView cost;
    @BindView(R.id.ketsaldo)
    TextView diskontext;
    @BindView(R.id.diskon)
    TextView diskon;
    @BindView(R.id.balance)
    TextView saldotext;
    @BindView(R.id.checkedcash)
    ImageButton checkedcash;
    @BindView(R.id.checkedwallet)
    ImageButton checkedwallet;
    @BindView(R.id.cashPayment)
    TextView cashpayment;
    @BindView(R.id.walletpayment)
    TextView walletpayment;
    @BindView(R.id.llcheckedwallet)
    LinearLayout llcheckedwallet;
    @BindView(R.id.llcheckedcash)
    LinearLayout llcheckedcash;
    @BindView(R.id.service)
    TextView fiturtext;
    @BindView(R.id.sendername)
    EditText sendername;
    @BindView(R.id.recievername)
    EditText recievername;
    @BindView(R.id.phonenumber)
    EditText senderphone;
    @BindView(R.id.phonenumberreceiever)
    EditText recieverphone;
    @BindView(R.id.rlprogress)
    RelativeLayout rlprogress;
    @BindView(R.id.rlnotif)
    RelativeLayout rlnotif;
    @BindView(R.id.textnotif)
    TextView textnotif;
    @BindView(R.id.order)
    Button order;

    @BindView(R.id.promocode)
    EditText promokode;

    @BindView(R.id.zipcode)
    EditText ezipcode;

    @BindView(R.id.btnzip)
    Button zipbtn;

    @BindView(R.id.btnpromo)
    Button btnpromo;

    @BindView(R.id.promonotif)
    TextView promonotif;

    byte[] imageByteArray;
    Bitmap decoded;
    @BindView(R.id.orderimage)
    ImageView imagesend;

//    @BindView(R.id.imgbtn)
//    Button imgbtn;

    @BindView(R.id.Totalchg)
    EditText Totalchg;
    @BindView(R.id.btnchg)
    Button btnchg;

    @BindView(R.id.job)
    Spinner agent;
    ArrayList<String> jobdata;
    ArrayList<AgentModel> fiturlist;
    List<AgentModel> joblist;

    String itemdetail, service, agentId;
    String country_iso_code = "en";
    Context context = SendDetailActivity.this;
    int fiturId;
    private LatLng pickUpLatLang;
    private LatLng destinationLatLang;
    private String pickup, icon, layanan, layanandesk;
    private String destination;
    private String biayaakhir;
    private ArrayList<DriverModel> driverAvailable;
    private ServiceModel fiturModel;
    Realm realm;
    private String saldoWallet,destaddress;
    private String checkedpaywallet, zipcode;
    private long price, promocode,prs;
    TransSendModel transaksi;
    private DriverRequest request;
    Thread thread;
    boolean threadRun = true;

    public static final String FITUR_KEY = "FiturKey";
    String ICONFITUR;
    private ServiceModel designedFitur;
    String getbiaya, biayaminimum;
    private String timeDistance, icondrver,prices;
    long maksimum;
    User userLogin;
    private double distance;







    /*
    * New line of code date - 05/07/22
    Start-
    * */
    @BindView(R.id.sender_price)
    TextView senderPriceText;

    @BindView(R.id.remaining_amount_price)
    TextView remainingAmountPriceText;

    @BindView(R.id.admin_price)
    TextView adminPriceText;

    @BindView(R.id.driver_price)
    TextView driverPriceText;

    @BindView(R.id.reciever_price)
    TextView recieverPriceText;

    private User loginUser;
    private Checkout checkout;
    private long senderPrice;
    private long remainingAmountPrice;
    private long adminPrice ;
    private long driverPrice;
    private Order orderId;
    private long recieverPrice;
    /*
    * End
    * */


    @SuppressLint("SetTextI18n")
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_send_detail);
        ButterKnife.bind(this);
        promocode = 0;
        realm = Realm.getDefaultInstance();
        userLogin = BaseApp.getInstance(this).getLoginUser();

        Intent intent1 = getIntent();
        fiturId = intent1.getIntExtra(FITUR_KEY, -1);
        ICONFITUR = intent1.getStringExtra("icon");
        if (fiturId != -1)
            designedFitur = realm.where(ServiceModel.class).equalTo("idFitur", fiturId).findFirst();

        service = String.valueOf(Objects.requireNonNull(designedFitur).getIdFitur());
        getbiaya = String.valueOf(designedFitur.getBiaya());
        biayaminimum = String.valueOf(designedFitur.getBiaya_minimum());
        biayaakhir = String.valueOf(designedFitur.getBiayaAkhir());
        icondrver = designedFitur.getIcon_driver();
        maksimum = Long.parseLong(designedFitur.getMaksimumdist());


        saldoWallet = String.valueOf(userLogin.getWalletSaldo());
        Intent intent = getIntent();
        prices  = getbiaya;
//
//       try {
           pickUpLatLang = new LatLng(Double.parseDouble(userLogin.getLatitude()), Double.parseDouble(userLogin.getLongitude()));

// 20.799903 ,70.697817
        pickuppoint = Point.fromLngLat(Double.parseDouble(userLogin.getLongitude()),
                Double.parseDouble(userLogin.getLatitude()));
//       }catch (Exception e){e.printStackTrace();}
  //
        pickup = userLogin.getAddress() + "," + userLogin.getCity() + "," + userLogin.getState();
        icon = intent.getStringExtra("icon");
        layanan = intent.getStringExtra("layanan");
        layanandesk = intent.getStringExtra("layanandesk");
        destination = intent.getStringExtra("destination");
        zipbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                zipcode = ezipcode.getText().toString();
                rlprogress.setVisibility(View.VISIBLE);
                getagents();
            }
        });

        fiturId = intent.getIntExtra(FITUR_KEY, -1);

        driverAvailable = (ArrayList<DriverModel>) intent.getSerializableExtra("driver");
        int selectedFitur = intent.getIntExtra(FITUR_KEY, -1);

        back_btn.setOnClickListener(view -> finish());

        topUp.setOnClickListener(v -> startActivity(new Intent(getApplicationContext(), TopupSaldoActivity.class)));

        if (selectedFitur != -1)
            fiturModel = realm.where(ServiceModel.class).equalTo("idFitur", selectedFitur).findFirst();
        assert fiturModel != null;
        service = String.valueOf(fiturModel.getIdFitur());



        checkedpaywallet = "0";
        checkedcash.setSelected(true);
        checkedwallet.setSelected(false);
        cashpayment.setTextColor(getResources().getColor(R.color.colorgradient));
        walletpayment.setTextColor(getResources().getColor(R.color.gray));
        checkedcash.setBackgroundTintList(getResources().getColorStateList(R.color.colorgradient));
        checkedwallet.setBackgroundTintList(getResources().getColorStateList(R.color.gray));


        dokument.setSelected(true);
        fashion.setSelected(false);
        box.setSelected(false);
        other.setSelected(false);
        itemdetail = "document";
        othertext.setVisibility(View.GONE);

        dokument.setOnClickListener(view -> {
            dokument.setSelected(true);
            fashion.setSelected(false);
            box.setSelected(false);
            other.setSelected(false);
            itemdetail = "document";
            othertext.setVisibility(View.GONE);
            othertext.setText("");
        });

        fashion.setOnClickListener(view -> {
            dokument.setSelected(false);
            fashion.setSelected(true);
            box.setSelected(false);
            other.setSelected(false);
            itemdetail = "fashion";
            othertext.setVisibility(View.GONE);
            othertext.setText("");
        });

        box.setOnClickListener(view -> {
            dokument.setSelected(false);
            fashion.setSelected(false);
            box.setSelected(true);
            other.setSelected(false);
            itemdetail = "box";
            othertext.setVisibility(View.GONE);
            othertext.setText("");
        });

        other.setOnClickListener(view -> {
            dokument.setSelected(false);
            fashion.setSelected(false);
            box.setSelected(false);
            other.setSelected(true);
            othertext.setVisibility(View.VISIBLE);
        });

        countrycode.setOnClickListener(new View.OnClickListener() {
            @SuppressLint("WrongConstant")
            @Override
            public void onClick(View v) {
                final CountryPicker picker = CountryPicker.newInstance("Select Country");
                picker.setListener(new CountryPickerListener() {
                    @Override
                    public void onSelectCountry(String name, String code, String dialCode, int flagDrawableResID) {
                        countrycode.setText(dialCode);
                        picker.dismiss();
                        country_iso_code = code;
                    }
                });
                picker.setStyle(R.style.countrypicker_style, R.style.countrypicker_style);
                picker.show(getSupportFragmentManager(), "Select Country");
            }
        });

        countrycodereceiver.setOnClickListener(new View.OnClickListener() {
            @SuppressLint("WrongConstant")
            @Override
            public void onClick(View v) {
                final CountryPicker picker = CountryPicker.newInstance("Select Country");
                picker.setListener(new CountryPickerListener() {
                    @Override
                    public void onSelectCountry(String name, String code, String dialCode, int flagDrawableResID) {
                        countrycodereceiver.setText(dialCode);
                        picker.dismiss();
                        country_iso_code = code;
                    }
                });
                picker.setStyle(R.style.countrypicker_style, R.style.countrypicker_style);
                picker.show(getSupportFragmentManager(), "Select Country");
            }
        });

        order.setOnClickListener(view -> {
            if (TextUtils.isEmpty(agentId)) {
                notif("Select Agent.");
            } else if (sendername.getText().toString().isEmpty()) {
                notif("Sender name cant be empty!");
            } else if (senderphone.getText().toString().isEmpty()) {
                notif("Sender phone cant be empty!");
            } else if (recievername.getText().toString().isEmpty()) {
                notif("Receiver cant be empty!");
            } else if (recieverphone.getText().toString().isEmpty()) {
                notif("Receiver phone cant be empty!");
            } else if (decoded==null){
                notif("Image cant be empty!");
            } else if ((price/100)<2){
                notif("Distance cant be less than 2 km");
            } else if(distance<2){
                notif("Distance cant be less than 2 km");
            } else {
                // onOrderButton();
                // Earlier this method was called here but now
                // after adding razorpay integration, this method is
                // called inside onPaymentSuccess() callback method
                // i.e when payment is successfully done
                // below method starts the payment process
                sendOrderPayment();
            }
        });
        btnpromo.setOnClickListener(v -> {
            try {
                InputMethodManager imm = (InputMethodManager) getSystemService(INPUT_METHOD_SERVICE);
                Objects.requireNonNull(imm).hideSoftInputFromWindow(Objects.requireNonNull(getCurrentFocus()).getWindowToken(), 0);
            } catch (Exception ignored) {

            }
            if (promokode.getText().toString().isEmpty()) {
                notif("Promo code cant be empty!");
            } else {
                promokodedata();
            }
        });


        btnchg.setOnClickListener(view -> {
            String text=Totalchg.getText().toString()+"00";
            price = Long.parseLong(text.toString());
//            float prs = Float.parseFloat(text);
            if(TextUtils.isEmpty(text)){
                Toast.makeText(getApplicationContext(), "Please input proper value!", Toast.LENGTH_SHORT).show();
            }
            else {
//                Double txt= Double.valueOf(text);
                Utility.currencyTXT(priceText,text,SendDetailActivity.this);

                senderPrice = (long) (price*0.18);
                Utility.currencyTXT(senderPriceText, String.valueOf(senderPrice), SendDetailActivity.this);
                remainingAmountPrice = price - senderPrice;
                Utility.currencyTXT(remainingAmountPriceText, String.valueOf(remainingAmountPrice), SendDetailActivity.this);
                adminPrice = (long) (price*0.04);
                Utility.currencyTXT(adminPriceText, String.valueOf(adminPrice), SendDetailActivity.this);
                driverPrice = (long) (price*0.6);
                Utility.currencyTXT(driverPriceText, String.valueOf(driverPrice), SendDetailActivity.this);
                recieverPrice = (long) (price*0.18);
                Utility.currencyTXT(recieverPriceText, String.valueOf(recieverPrice), SendDetailActivity.this);

//                priceText.setText("Rs."+prs);
                Totalchg.setText("");
//                price= Long.parseLong(priceText.getText().toString().substring(3));
            }
        });

        imagesend.setOnClickListener(view -> {
                    if (check_camrapermission())
                        openCameraIntent();
                }
//                    selectImage();}
//            ChooseImagePicker();
//            if (checkPermissionforCamera()){
//                takePictureFromCamera();}
        );



        loginUser = BaseApp.getInstance(context).getLoginUser();
        //checkout = new Checkout();
        Checkout.preload(getApplicationContext());
      //  checkout.setKeyID("rzp_test_O2W38TDfDA7lTP");


    }




    //upload image try

//    private boolean check_ReadStoragepermission() {
//        if (ContextCompat.checkSelfPermission(this.getApplicationContext(),
//                Manifest.permission.READ_EXTERNAL_STORAGE)
//                == PackageManager.PERMISSION_GRANTED) {
//            return true;
//        } else {
//            try {
//                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
//                    requestPermissions(new String[]{Manifest.permission.READ_EXTERNAL_STORAGE},
//                            Constant.permission_Read_data);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                throw e;
//            }
//        }
//        return false;
//    }
//
//    private void selectImage() {
//        if (check_ReadStoragepermission()) {
//            Intent intent = new Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
//            startActivityForResult(intent, 2);
//        }
//    }
//
//    public String getPath(Uri uri) {
//        String result = null;
//        String[] proj = {MediaStore.Images.Media.DATA};
//        Cursor cursor = this.getContentResolver().query(uri, proj, null, null, null);
//        if (cursor != null) {
//            if (cursor.moveToFirst()) {
//                int column_index = cursor.getColumnIndexOrThrow(proj[0]);
//                result = cursor.getString(column_index);
//            }
//            cursor.close();
//        }
//        if (result == null) {
//            result = "Not found";
//        }
//        return result;
//    }
//
//    @Override
//    public void onActivityResult(int requestCode, int resultCode, Intent data) {
//
//        super.onActivityResult(requestCode, resultCode, data);
//
//        if (resultCode == RESULT_OK) {
//
//            if (requestCode == 2) {
//                Uri selectedImage = data.getData();
//                InputStream imageStream = null;
//                try {
//                    imageStream = this.getContentResolver().openInputStream(Objects.requireNonNull(selectedImage));
//                } catch (FileNotFoundException e) {
//                    e.printStackTrace();
//                }
//                final Bitmap imagebitmap = BitmapFactory.decodeStream(imageStream);
//                Bitmap scaleBitmap = Bitmap.createScaledBitmap(imagebitmap, (int) (imagebitmap.getWidth() * 0.1), (int) (imagebitmap.getHeight()*0.1) ,  true);
//
//                String path = getPath(selectedImage);
//                Matrix matrix = new Matrix();
//                ExifInterface exif;
//                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
//                    try {
//                        exif = new ExifInterface(path);
//                        int orientation = exif.getAttributeInt(ExifInterface.TAG_ORIENTATION, 1);
//                        switch (orientation) {
//                            case ExifInterface.ORIENTATION_ROTATE_90:
//                                matrix.postRotate(90);
//                                break;
//                            case ExifInterface.ORIENTATION_ROTATE_180:
//                                matrix.postRotate(180);
//                                break;
//                            case ExifInterface.ORIENTATION_ROTATE_270:
//                                matrix.postRotate(270);
//                                break;
//                        }
//                    } catch (IOException e) {
//                        e.printStackTrace();
//                    }
//                }
//
//
//                Bitmap rotatedBitmap = Bitmap.createBitmap(scaleBitmap, 0, 0, scaleBitmap.getWidth(), scaleBitmap.getHeight(), matrix, true);
//                ByteArrayOutputStream baos = new ByteArrayOutputStream();
//                rotatedBitmap.compress(Bitmap.CompressFormat.JPEG, 20, baos);
//                imagesend.setImageBitmap(rotatedBitmap);
//                imageByteArray = baos.toByteArray();
//                decoded = BitmapFactory.decodeStream(new ByteArrayInputStream(baos.toByteArray()));
//
//            }
//
//        }
//
//    }
//
//    public String getStringImage(Bitmap bmp) {
//        ByteArrayOutputStream baos = new ByteArrayOutputStream();
//        bmp.compress(Bitmap.CompressFormat.JPEG, 20, baos);
//        imageByteArray = baos.toByteArray();
//        return Base64.encodeToString(imageByteArray, Base64.DEFAULT);
//    }

    //try



    private boolean check_camrapermission() {

        if (ContextCompat.checkSelfPermission(this,
                Manifest.permission.CAMERA)
                == PackageManager.PERMISSION_GRANTED) {

            return true;

        } else {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                requestPermissions(
                        new String[]{Manifest.permission.CAMERA}, Constant.permission_camera_code);
            }
        }
        return false;
    }

    private void openCameraIntent() {
        Intent pictureIntent = new Intent(
                MediaStore.ACTION_IMAGE_CAPTURE);
        if (pictureIntent.resolveActivity(this.getPackageManager()) != null) {
            File photoFile = null;
            try {
                photoFile = createImageFile();
            } catch (IOException ignored) {

            }
            if (photoFile != null) {
                Uri photoURI = FileProvider.getUriForFile(this.getApplicationContext(), this.getPackageName() + ".fileprovider", photoFile);
                pictureIntent.putExtra(MediaStore.EXTRA_OUTPUT, photoURI);
                startActivityForResult(pictureIntent, 2);
            }
        }
    }

    String imageFilePath;

    private File createImageFile() throws IOException {
        String timeStamp =
                new SimpleDateFormat("yyyyMMdd_HHmmss",
                        Locale.getDefault()).format(new Date());
        String imageFileName = "IMG_" + timeStamp + "_";
        File storageDir =
                this.getExternalFilesDir(Environment.DIRECTORY_PICTURES);
        File image = File.createTempFile(
                imageFileName,  /* prefix */
                ".jpg",         /* suffix */
                storageDir      /* directory */
        );

        imageFilePath = image.getAbsolutePath();
        return image;
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

//        if(requestCode==2){
//                if (resultCode == RESULT_OK) {
//
//                    Bundle bundle=data.getExtras();
//                    Bitmap bitmap= (Bitmap) bundle.get("data");
//                    imagesend.setImageBitmap(bitmap);
//
//                }
//        }
        if (resultCode == RESULT_OK) {

            if (requestCode == 2) {
                Matrix matrix = new Matrix();
                try {
                    ExifInterface exif = new ExifInterface(imageFilePath);
                    int orientation = exif.getAttributeInt(ExifInterface.TAG_ORIENTATION, 1);
                    switch (orientation) {
                        case ExifInterface.ORIENTATION_ROTATE_90:
                            matrix.postRotate(90);
                            break;
                        case ExifInterface.ORIENTATION_ROTATE_180:
                            matrix.postRotate(180);
                            break;
                        case ExifInterface.ORIENTATION_ROTATE_270:
                            matrix.postRotate(270);
                            break;
                    }

                } catch (IOException e) {
                    e.printStackTrace();
                }
                Uri selectedImage = (Uri.fromFile(new File(imageFilePath)));

                InputStream imageStream = null;
                try {
                    imageStream = getContentResolver().openInputStream(selectedImage);
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                }
                final Bitmap imagebitmap = BitmapFactory.decodeStream(imageStream);
                Bitmap scaleBitmap = Bitmap.createScaledBitmap(imagebitmap, (int) (imagebitmap.getWidth() * 0.1), (int) (imagebitmap.getHeight()*0.1) ,  true);
                Bitmap rotatedBitmap = Bitmap.createBitmap(scaleBitmap, 0, 0, scaleBitmap.getWidth(), scaleBitmap.getHeight(), matrix, true);
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                rotatedBitmap.compress(Bitmap.CompressFormat.JPEG, 20, baos);
                imagesend.setImageBitmap(rotatedBitmap);
                imageByteArray = baos.toByteArray();
                decoded = BitmapFactory.decodeStream(new ByteArrayInputStream(baos.toByteArray()));
            }

        }


    }

    public String getStringImage(Bitmap bmp) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        bmp.compress(Bitmap.CompressFormat.JPEG, 20, baos);
        imageByteArray = baos.toByteArray();
        return Base64.encodeToString(imageByteArray, Base64.DEFAULT);
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
//        if (requestCode==20 && grantResults[0]== PackageManager.PERMISSION_GRANTED){
//            takePictureFromCamera();
//
//        }else {
//            Toast.makeText(SendDetailActivity.this, "Permission not granted", Toast.LENGTH_SHORT).show();
//        }

        if (requestCode == Constant.permission_camera_code) {

            if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Toast.makeText(this, "Tap again", Toast.LENGTH_SHORT).show();

            } else {

                Toast.makeText(this, "camera permission denied", Toast.LENGTH_LONG).show();

            }
        }
    }
//
//
//    private void takePictureFromCamera() {
//        Intent imageint=new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
//        if (imageint.resolveActivity(getPackageManager())!=null){
//            startActivityForResult(imageint,2);
//        }
//    }



    Point pickuppoint, destinationpoint;

    private void getRoute() {
        if (pickuppoint != null && destinationpoint != null) {
            rlprogress.setVisibility(View.VISIBLE);
            Log.d("pickup",""+pickuppoint);
            Log.d("destinationpoint",""+destinationpoint);
            MapboxDirections client = MapboxDirections.builder()
                    .origin(pickuppoint)
                    .destination(destinationpoint)
                    .profile(DirectionsCriteria.PROFILE_DRIVING_TRAFFIC)
                    .accessToken(getString(R.string.mapbox_access_token))
                    .build();
            client.enqueueCall(new Callback<DirectionsResponse>() {
                @SuppressLint("SetTextI18n")
                @Override
                public void onResponse(@NonNull Call<DirectionsResponse> call, @NonNull Response<DirectionsResponse> response) {
                    if (response.body() == null) {
                        Timber.d("No routes found, make sure you set the right user and access token.");
                        return;
                    } else if (response.body().routes().size() < 1) {
                        Timber.d("No routes found");
                        return;
                    }
                    DirectionsRoute currentroute = response.body().routes().get(0);
                    rlprogress.setVisibility(View.GONE);
                    String format = String.format(Locale.US, "%.0f", currentroute.distance() / 1000f);
                    long dist = Long.parseLong(format);
                    if (dist < maksimum) {
                        rlprogress.setVisibility(View.GONE);
//                        String formast = String.format(Locale.US, "%.0f", dist);
//                        distance = Double.parseDouble(String.valueOf(dist));
//                        Log.d("distance",""+distance);
                        long minutes = (long) ((currentroute.duration() / 60));
                        timeDistance = minutes + " mins";
                        biayaakhir = String.valueOf(fiturModel.getBiayaAkhir());
                        fiturtext.setText(timeDistance);
                        float km = ((float) dist);
                        String formats = String.format(Locale.US, "%.1f", km);
                        distanceText.setText(formats);
                        distance = Double.parseDouble(formats);
                        Utility.currencyTXT(cost, String.valueOf(price), SendDetailActivity.this);
                        Utility.currencyTXT(diskon, String.valueOf(promocode), SendDetailActivity.this);
                        diskontext.setText("Discount " + fiturModel.getDiskon() + " with Wallet");

                        String costs = String.valueOf(biayaminimum);
                        long biayaTotal = (long) (Double.parseDouble(Objects.requireNonNull(prices)) * km);
                        if (biayaTotal < Double.parseDouble(Objects.requireNonNull(biayaminimum))) {
                            price = Long.parseLong(biayaminimum);
                            biayaTotal = Long.parseLong(biayaminimum);
                            Utility.currencyTXT(cost, costs, SendDetailActivity.this);
                        } else {
                            Utility.currencyTXT(cost, prices, SendDetailActivity.this);
                        }
                        price = biayaTotal;

                        final long finalBiayaTotal = biayaTotal;
                        String totalbiaya = String.valueOf(finalBiayaTotal);
                        Utility.currencyTXT(priceText, totalbiaya, SendDetailActivity.this);


                        /*
                        * New line of code date - 05/07/22
                        Start-
                        * */
                        senderPrice = (long) (price*0.18);
                        Utility.currencyTXT(senderPriceText, String.valueOf(senderPrice), SendDetailActivity.this);
                        remainingAmountPrice = price - senderPrice;
                        Utility.currencyTXT(remainingAmountPriceText, String.valueOf(remainingAmountPrice), SendDetailActivity.this);
                        adminPrice = (long) (price*0.04);
                        Utility.currencyTXT(adminPriceText, String.valueOf(adminPrice), SendDetailActivity.this);
                        driverPrice = (long) (price*0.6);
                        Utility.currencyTXT(driverPriceText, String.valueOf(driverPrice), SendDetailActivity.this);
                        recieverPrice = (long) (price*0.18);
                        Utility.currencyTXT(recieverPriceText, String.valueOf(recieverPrice), SendDetailActivity.this);
                        /*
                        * End
                        * */


                        long saldokini = Long.parseLong(saldoWallet);
                        if (saldokini < (biayaTotal - (price * Double.parseDouble(biayaakhir)))) {
                            llcheckedcash.setOnClickListener(view -> {
                                String totalbiaya1 = String.valueOf(finalBiayaTotal);
                                Utility.currencyTXT(priceText, totalbiaya1, context);
                                Utility.currencyTXT(diskon, String.valueOf(promocode), SendDetailActivity.this);
                                checkedcash.setSelected(true);
                                checkedwallet.setSelected(false);
                                checkedpaywallet = "0";
                                cashpayment.setTextColor(getResources().getColor(R.color.colorgradient));
                                walletpayment.setTextColor(getResources().getColor(R.color.gray));
                                checkedcash.setBackgroundTintList(getResources().getColorStateList(R.color.colorgradient));
                                checkedwallet.setBackgroundTintList(getResources().getColorStateList(R.color.gray));
                            });
                        } else {
                            llcheckedcash.setOnClickListener(view -> {
                                String totalbiaya12 = String.valueOf(finalBiayaTotal);
                                Utility.currencyTXT(priceText, totalbiaya12, context);
                                Utility.currencyTXT(diskon, String.valueOf(promocode), SendDetailActivity.this);
                                checkedcash.setSelected(true);
                                checkedwallet.setSelected(false);
                                checkedpaywallet = "0";
                                cashpayment.setTextColor(getResources().getColor(R.color.colorgradient));
                                walletpayment.setTextColor(getResources().getColor(R.color.gray));
                                checkedcash.setBackgroundTintList(getResources().getColorStateList(R.color.colorgradient));
                                checkedwallet.setBackgroundTintList(getResources().getColorStateList(R.color.gray));
                            });

                            final long finalBiayaTotal1 = biayaTotal;
                            llcheckedwallet.setOnClickListener(view -> {
                                long diskonwallet = (long) (Double.parseDouble(biayaakhir) * price);
                                String totalwallet = String.valueOf(diskonwallet + promocode);
                                Utility.currencyTXT(diskon, totalwallet, context);
                                String totalbiaya13 = String.valueOf(finalBiayaTotal1 - (diskonwallet + promocode));
                                Utility.currencyTXT(priceText, totalbiaya13, context);
                                checkedcash.setSelected(false);
                                checkedwallet.setSelected(true);
                                checkedpaywallet = "1";
                                walletpayment.setTextColor(getResources().getColor(R.color.colorgradient));
                                cashpayment.setTextColor(getResources().getColor(R.color.gray));
                                checkedwallet.setBackgroundTintList(getResources().getColorStateList(R.color.colorgradient));
                                checkedcash.setBackgroundTintList(getResources().getColorStateList(R.color.gray));
                            });
                        }

                    } else {
                        rlprogress.setVisibility(View.GONE);
                        notif("destination too far away!");
                    }

                }

                @Override
                public void onFailure(@NonNull Call<DirectionsResponse> call, @NonNull Throwable throwable) {
                    Timber.d("Error: %s", throwable.getMessage());
                }
            });
        }
    }
    @SuppressLint("SetTextI18n")
    private void promokodedata() {
        btnpromo.setEnabled(false);
        btnpromo.setText("Wait...");
        final User user = BaseApp.getInstance(this).getLoginUser();
        PromoRequestJson request = new PromoRequestJson();
        request.setFitur(service);
        request.setCode(promokode.getText().toString());

        UserService service = ServiceGenerator.createService(UserService.class, user.getNoTelepon(), user.getPassword());
        service.promocode(request).enqueue(new Callback<PromoResponseJson>() {
            @Override
            public void onResponse(@NonNull Call<PromoResponseJson> call, @NonNull Response<PromoResponseJson> response) {
                if (response.isSuccessful()) {
                    if (Objects.requireNonNull(response.body()).getMessage().equalsIgnoreCase("success")) {
                        btnpromo.setEnabled(true);
                        btnpromo.setText("Use");
                        if (response.body().getType().equals("persen")) {
                            promocode = (Long.parseLong(response.body().getNominal()) * price) / 100;
                        } else {
                            promocode = Long.parseLong(response.body().getNominal());
                        }
                        if (checkedpaywallet.equals("1")) {
                            long diskonwallet = (long) (Double.parseDouble(biayaakhir) * price);
                            String diskontotal = String.valueOf(diskonwallet + promocode);
                            String totalbiaya = String.valueOf(price - (diskonwallet + promocode));
                            price = Long.parseLong(totalbiaya);
                            Utility.currencyTXT(priceText, totalbiaya, context);
                            Utility.currencyTXT(diskon, diskontotal, SendDetailActivity.this);
                        } else {
                            String diskontotal = String.valueOf(promocode);
                            String totalbiaya = String.valueOf(price - promocode);
                            price = Long.parseLong(totalbiaya);
                            Utility.currencyTXT(priceText, totalbiaya, context);
                            Utility.currencyTXT(diskon, diskontotal, SendDetailActivity.this);
                        }
                    } else {
                        btnpromo.setEnabled(true);
                        btnpromo.setText("Use");
                        notif("promo code not available!");
                        promocode = 0;
                        if (checkedpaywallet.equals("1")) {
                            long diskonwallet = (long) (Double.parseDouble(biayaakhir) * price);
                            String diskontotal = String.valueOf(diskonwallet + promocode);
                            String totalbiaya = String.valueOf(price - (diskonwallet + promocode));
                            price = Long.parseLong(totalbiaya);
                            Utility.currencyTXT(priceText, totalbiaya, context);
                            Utility.currencyTXT(diskon, diskontotal, SendDetailActivity.this);
                        } else {
                            String diskontotal = String.valueOf(promocode);
                            String totalbiaya = String.valueOf(price - promocode);
                            price = Long.parseLong(totalbiaya);
                            Utility.currencyTXT(priceText, totalbiaya, context);
                            Utility.currencyTXT(diskon, diskontotal, SendDetailActivity.this);
                        }
                    }
                } else {
                    notif("error!");
                }
            }

            @Override
            public void onFailure(@NonNull Call<PromoResponseJson> call, @NonNull Throwable t) {
                t.printStackTrace();
                notif("error");
            }
        });
    }


    private void getagents() {
        fiturlist = new ArrayList<>();
        jobdata = new ArrayList<>();
        ArrayAdapter<String> jobSpinner = new ArrayAdapter<>(SendDetailActivity.this, R.layout.spinner, jobdata);
        jobSpinner.setDropDownViewResource(R.layout.spinner);
        agent.setAdapter(jobSpinner);
        
        AgentModel jobs = new AgentModel();
        jobs.setId("");
        jobs.setAgent2_customer_fullname("Select Agent");
        fiturlist.add(jobs);
        jobdata.add("Select Agent");
        User loginUser = BaseApp.getInstance(this).getLoginUser();

        AgentResponseJson param = new AgentResponseJson();
        param.setIdPelanggan(loginUser.getId());
//        param.setEndLatitude(destinationLatLang.getLatitude());
//        param.setEndLongitude(destinationLatLang.getLongitude());
        param.setZipcode(zipcode);

        UserService service = ServiceGenerator.createService(UserService.class, loginUser.getEmail(), loginUser.getPassword());
        service.request_agents_list(param).enqueue(new Callback<AgentResponseJson>() {
            @Override
            public void onResponse(@NonNull Call<AgentResponseJson> call, @NonNull Response<AgentResponseJson> response) {

                rlprogress.setVisibility(View.GONE);
                if (response.isSuccessful()) {
                    if (Objects.requireNonNull(response.body()).getMessage().equalsIgnoreCase("success")) {
                        joblist = response.body().getData();
                        for (int i = 0; i < joblist.size(); i++) {
                            AgentModel jobber = new AgentModel();
                            jobber.setId(joblist.get(i).getId());
                            jobber.setAgent2_address(joblist.get(i).getAgent2_address());
                            jobber.setAgent2_city(joblist.get(i).getAgent2_city());
                            jobber.setAgent2_state(joblist.get(i).getAgent2_state());
                            jobber.setAgent2_zipcode(joblist.get(i).getAgent2_zipcode());
                            jobber.setAgent2_customer_fullname(joblist.get(i).getAgent2_customer_fullname());
                            jobber.setAgent2_phone_number(joblist.get(i).getAgent2_phone_number());
                            jobber.setAgent2_latitude(joblist.get(i).getAgent2_latitude());
                            jobber.setAgent2_longitude(joblist.get(i).getAgent2_longitude());
                            fiturlist.add(jobber);
                            jobdata.add(joblist.get(i).getAgent2_customer_fullname());
                        }
                        ArrayAdapter<String> jobSpinner = new ArrayAdapter<>(SendDetailActivity.this, R.layout.spinner, jobdata);
                        jobSpinner.setDropDownViewResource(R.layout.spinner);
                        agent.setAdapter(jobSpinner);
                        agent.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {

                            @Override
                            public void onItemSelected(AdapterView<?> parent, View view,
                                                       int position, long id) {
                                // TODO Auto-generated method stub
                                if (position == 0) {
                                    ((TextView) parent.getChildAt(0)).setTextColor(getResources().getColor(R.color.gray));
                                    ((TextView) parent.getChildAt(0)).setTextSize(14);
                                    agentId = String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getId());
                                    destaddress = String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_address())
                                    +","+String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_city()) +","+
                                            String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_state())  +"-"+
                                            String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_zipcode()) ;
//                                    destinationLatLang = new LatLng(Double.parseDouble(String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_latitude()),)
//                                            String.valueOf(Double.parseDouble(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_longitude())));
//
//                                    pickuppoint = Point.fromLngLat(Double.parseDouble(String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_longitude())),
//                                            Double.parseDouble(String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_latitude())));
//                                    getRoute();

                                } else {
                                    ((TextView) parent.getChildAt(0)).setTextColor(getResources().getColor(R.color.black));
                                    ((TextView) parent.getChildAt(0)).setTextSize(14);
                                    agentId = String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getId());

                                    destaddress = String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_address())
                                            +","+String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_city()) +","+
                                            String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_state())  +"-"+
                                            String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_zipcode()) ;

                                    if(!TextUtils.isEmpty(String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_latitude()))
                                    && !TextUtils.isEmpty(String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_longitude()))
                                    && !String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_latitude()).equalsIgnoreCase("0.0")
                                            && !String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_longitude()).equalsIgnoreCase("0.0")) {
                                        destinationLatLang = new LatLng(Double.parseDouble(String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_latitude())),
                                                Double.parseDouble(String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_longitude())));


                                        destinationpoint = Point.fromLngLat(Double.parseDouble(String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_longitude())),
                                                Double.parseDouble(String.valueOf(fiturlist.get(agent.getSelectedItemPosition()).getAgent2_latitude())));
                                        getRoute();
                                    }
                                }
                            }

                            @Override
                            public void onNothingSelected(AdapterView<?> parent) {

                            }
                        });

                    }
                }
            }

            @Override
            public void onFailure(@NonNull Call<AgentResponseJson> call, @NonNull Throwable t) {
                t.printStackTrace();
            }
        });
    }

    @Override
    protected void onResume() {
        super.onResume();
        User userLogin = BaseApp.getInstance(this).getLoginUser();
        saldoWallet = String.valueOf(userLogin.getWalletSaldo());

        Utility.currencyTXT(saldotext, saldoWallet, this);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        realm.close();
    }

    private void onOrderButton() {
        if (checkedpaywallet.equals("1")) {
            if (TextUtils.isEmpty(agentId)) {
                notif("Please Select Agent.");
            } else {
                rlprogress.setVisibility(View.VISIBLE);
                SendRequestJson param = new SendRequestJson();
                User userLogin = BaseApp.getInstance(this).getLoginUser();
                param.setIdPelanggan(userLogin.getId());
                param.setOrderFitur(String.valueOf(fiturModel.getIdFitur()));
                param.setDestination_customer_id(agentId);
                param.setStartLatitude(pickUpLatLang.getLatitude());
                param.setStartLongitude(pickUpLatLang.getLongitude());
                param.setEndLatitude(destinationLatLang.getLatitude());
                param.setEndLongitude(destinationLatLang.getLongitude());
                param.setJarak(distance);
                param.setHarga(this.price);
                param.setEstimasi(fiturtext.getText().toString());
                param.setKreditpromo(String.valueOf((Double.parseDouble(biayaakhir) * this.price) + promocode));
                param.setAlamatAsal(pickup);
                param.setAlamatTujuan(destaddress);
                param.setPakaiWallet(1);
                param.setNamaPengirim(sendername.getText().toString());
                param.setTeleponPengirim(countrycode.getText().toString() + senderphone.getText().toString());
                param.setNamaPenerima(recievername.getText().toString());
                param.setTeleponPenerima(countrycodereceiver.getText().toString() + recieverphone.getText().toString());
                param.setOrderimage(getStringImage(decoded));
                //
                if (!othertext.getText().toString().isEmpty()) {
                    param.setNamaBarang(othertext.getText().toString());
                } else {
                    param.setNamaBarang(itemdetail);
                }
                sendRequestTransaksi(param);
            }
        } else {
            if (TextUtils.isEmpty(agentId)) {
                notif("Please Select Agent.");
            } else {
//            if (driverAvailable.isEmpty()) {
//                notif("Sorry, there are no drivers around you.");
//            } else {
                rlprogress.setVisibility(View.VISIBLE);
                SendRequestJson param = new SendRequestJson();
                User userLogin = BaseApp.getInstance(this).getLoginUser();
                param.setIdPelanggan(userLogin.getId());
                param.setOrderFitur(String.valueOf(fiturModel.getIdFitur()));
                param.setStartLatitude(pickUpLatLang.getLatitude());
                param.setStartLongitude(pickUpLatLang.getLongitude());
                param.setDestination_customer_id(agentId);
                param.setEndLatitude(destinationLatLang.getLatitude());
                param.setEndLongitude(destinationLatLang.getLongitude());
                param.setJarak(distance);
                param.setHarga(this.price);
                param.setEstimasi(fiturtext.getText().toString());
                param.setKreditpromo(String.valueOf(promocode));
                param.setAlamatAsal(pickup);
                param.setAlamatTujuan(destaddress);
                param.setPakaiWallet(0);
                param.setNamaPengirim(sendername.getText().toString());
                param.setTeleponPengirim(countrycode.getText().toString() + senderphone.getText().toString());
                param.setNamaPenerima(recievername.getText().toString());
                param.setTeleponPenerima(countrycodereceiver.getText().toString() + recieverphone.getText().toString());
                param.setOrderimage(getStringImage(decoded));
                if (!othertext.getText().toString().isEmpty()) {
                    param.setNamaBarang(othertext.getText().toString());
                } else {
                    param.setNamaBarang(itemdetail);
                }

                sendRequestTransaksi(param);
            }
        }
    }

    public void notif(String text) {
        rlnotif.setVisibility(View.VISIBLE);
        textnotif.setText(text);

        new Handler().postDelayed(() -> rlnotif.setVisibility(View.GONE), 3000);
    }

    private void sendRequestTransaksi(SendRequestJson param) {
        rlprogress.setVisibility(View.VISIBLE);
        User loginUser = BaseApp.getInstance(this).getLoginUser();
        final BookService service = ServiceGenerator.createService(BookService.class, loginUser.getEmail(), loginUser.getPassword());

        service.requestTransaksisend(param).enqueue(new Callback<SendResponseJson>() {
            @Override
            public void onResponse(@NonNull Call<SendResponseJson> call, @NonNull Response<SendResponseJson> response) {
                if (response.isSuccessful()) {
                    rlprogress.setVisibility(View.GONE);
                    if (response.body().getMessage().equalsIgnoreCase("success")) {
                        notif("Order generated successfully!");
                        final Handler handler = new Handler(Looper.getMainLooper());
                        handler.postDelayed(new Runnable() {
                            @Override
                            public void run() {
                                //Do something after 100ms
                                finish();

                            }
                        }, 1010);
                    } else {
                        notif("" + response.body().getMessage());
                        final Handler handler = new Handler(Looper.getMainLooper());
                        handler.postDelayed(new Runnable() {
                            @Override
                            public void run() {
                                //Do something after 100ms
                                Intent i = new Intent(getApplicationContext(), SendDetailActivity.class);
                                i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
                                i.putExtra("FiturKey", fiturId);
                                i.putExtra("icon", icon);
                                startActivity(i);
                                finish();

                            }
                        }, 2010);
                    }


                }
            }

            @Override
            public void onFailure(@NonNull Call<SendResponseJson> call, @NonNull Throwable t) {
                t.printStackTrace();
                notif("Your account has a problem, please contact customer service!");
                rlprogress.setVisibility(View.GONE);
            }
        });
    }

    private void buildDriverRequest(SendResponseJson response) {
        transaksi = response.getData().get(0);
        User loginUser = BaseApp.getInstance(this).getLoginUser();
        if (request == null) {
            request = new DriverRequest();
            request.setIdTransaksi(transaksi.getId());
            request.setIdPelanggan(transaksi.getIdPelanggan());
            request.setRegIdPelanggan(loginUser.getToken());
            request.setOrderFitur(fiturModel.getHome());
            request.setStartLatitude(transaksi.getStartLatitude());
            request.setStartLongitude(transaksi.getStartLongitude());
            request.setEndLatitude(transaksi.getEndLatitude());
            request.setEndLongitude(transaksi.getEndLongitude());
            request.setJarak(transaksi.getJarak());
            request.setHarga(transaksi.getHarga());
            request.setWaktuOrder(transaksi.getWaktuOrder());
            request.setAlamatAsal(transaksi.getAlamatAsal());
            request.setAlamatTujuan(transaksi.getAlamatTujuan());
            request.setKodePromo(transaksi.getKodePromo());
            request.setKreditPromo(transaksi.getKreditPromo());
            request.setPakaiWallet(String.valueOf(transaksi.isPakaiWallet()));
            request.setEstimasi(transaksi.getEstimasi());
            request.setLayanan(layanan);
            request.setLayanandesc(layanandesk);
            request.setIcon(icon);
            request.setBiaya(cost.getText().toString());
            request.setDistance(distanceText.getText().toString());



            String namaLengkap = String.format("%s", loginUser.getFullnama());
            request.setNamaPelanggan(namaLengkap);
            request.setTelepon(loginUser.getNoTelepon());
            request.setType(ORDER);
        }
    }

    private void fcmBroadcast(int index, List<DriverModel> driverList) {
        DriverModel driverToSend = driverList.get(index);
        request.setTime_accept(new Date().getTime() + "");
        final FCMMessage message = new FCMMessage();
        message.setTo(driverToSend.getRegId());
        message.setData(request);


        FCMHelper.sendMessage(Constant.FCM_KEY, message).enqueue(new okhttp3.Callback() {
            @Override
            public void onResponse(@NonNull okhttp3.Call call, @NonNull okhttp3.Response response) {
            }

            @Override
            public void onFailure(@NonNull okhttp3.Call call, @NonNull IOException e) {
                e.printStackTrace();
            }
        });
    }

    @SuppressWarnings("unused")
    @Subscribe(sticky = true, threadMode = ThreadMode.MAIN)
    public void onMessageEvent(final DriverResponse response) {
        if (response.getResponse().equalsIgnoreCase(DriverResponse.ACCEPT) || response.getResponse().equals("3") || response.getResponse().equals("4")) {
            runOnUiThread(() -> {
                threadRun = false;
                for (DriverModel cDriver : driverAvailable) {
                    if (cDriver.getId().equals(response.getId())) {


                        Intent intent = new Intent(SendDetailActivity.this, ProgressActivity.class);
                        intent.putExtra("driver_id", cDriver.getId());
                        intent.putExtra("transaction_id", request.getIdTransaksi());
                        intent.putExtra("response", "2");
                        startActivity(intent);
                        DriverResponse response1 = new DriverResponse();
                        response1.setId("");
                        response1.setIdTransaksi("");
                        response1.setResponse("");
                        EventBus.getDefault().postSticky(response1);
                        finish();
                    }
                }
            });
        }
    }

    @Override
    protected void onStart() {
        super.onStart();
        EventBus.getDefault().register(this);
    }

    @Override
    protected void onStop() {
        super.onStop();
        EventBus.getDefault().unregister(this);
    }


    public void sendOrderPayment(){





        // totalPrice= Long.parseLong(priceText.getText().toString().substring(3));
        String userEmail = loginUser.getEmail();
        String userPhone = loginUser.getPhone();




        Checkout checkout = new Checkout();
       // checkout.setKeyID("rzp_test_O2W38TDfDA7lTP"); // Test key id
       // checkout.setKeyID("rzp_live_kJVP8vCygQRWYG"); // previous Live key id
        checkout.setKeyID("rzp_test_83uHS4Fy5BVJJE");// updated Test key id

        /**
         * Instantiate Checkout
         */


        /**
         * Set your logo here
         */
        checkout.setImage(R.drawable.logosplash);

        /**
         * Reference to current activity
         */
        final Activity activity = this;

        /**
         * Pass your payment options to the Razorpay Checkout as a JSONObject
         */
        try {
            JSONObject options = new JSONObject();

            options.put("name", "SlogAgent ");

            String orderDescription = "Total Amount " + price/(100*1.00) + "," +
                                      " Sender Agent " + senderPrice/(100*1.00) + "," +
                                      " Remaining Amount "+ remainingAmountPrice/(100*1.00) + "," +
                                       " Admin " + adminPrice/(100*1.00) +  "," +
                                       " Driver " + driverPrice/(100*1.00) +  "," +
                                       " Reciever Agent " + recieverPrice/(100*1.00) ;

            options.put("description", orderDescription);
            options.put("image", "https://s3.amazonaws.com/rzp-mobile/images/rzp.png");
            if(orderId!=null) {
                options.put("order_id", orderId);//from response of step 3.
            }
            options.put("theme.color", "#3399cc");
            options.put("currency", "INR");
            options.put("amount", remainingAmountPrice);//pass amount in currency subunits 500 x 100

            JSONObject preFill = new JSONObject();
            preFill.put("email", userEmail);
            preFill.put("contact", userPhone);
            options.put("prefill", preFill);

        //    JSONObject notes = new JSONObject();
          //  notes.put("notes_key_1","Tea, Earl Grey, Hot");
           // notes.put("notes_key_1","Tea, Earl Grey, Hot");
          //  options.put("notes",notes);



            JSONObject retryObj = new JSONObject();
            retryObj.put("enabled", true);
            retryObj.put("max_count", 4);
            options.put("retry", retryObj);

            checkout.open(activity, options);

        } catch(Exception e) {
            Log.e("TAG", "Error in starting Razorpay Checkout", e);
        }


    }


    @Override
    public void onPaymentSuccess(String s) {
        Toast.makeText(this, "Payment successfully done! " + s, Toast.LENGTH_SHORT).show();

        onOrderButton();
    }

    @Override
    public void onPaymentError(int code, String s) {
        try {
            Toast.makeText(this, "Payment error please try again", Toast.LENGTH_SHORT).show();
        } catch (Exception e) {
            Log.e("OnPaymentError", "Exception in onPaymentError", e);
        }
    }


}
