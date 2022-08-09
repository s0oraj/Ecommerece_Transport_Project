package com.slog.agentassignment.fragment;


import android.content.Context;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.facebook.shimmer.ShimmerFrameLayout;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.slog.agentassignment.R;
import com.slog.agentassignment.models.RecieveOrdersModel;
import com.slog.agentassignment.item.RecieverAdapter;
import com.slog.agentassignment.constants.BaseApp;
import com.slog.agentassignment.constants.Constant;
import com.slog.agentassignment.models.FavouriteModel;
import com.slog.agentassignment.models.User;
import com.slog.agentassignment.utils.DatabaseHelper;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import timber.log.Timber;

import com.slog.agentassignment.item.RecieverAdapter.MyAdapterListener;

public class ReceivedFragment extends Fragment   {


    EditText editText;
    Button getTransactionsList;

    private ShimmerFrameLayout shimmer;

    private Context context;
    private ArrayList<FavouriteModel> listItem;
    private RecyclerView recyclerView;
    private DatabaseHelper databaseHelper;
    private RelativeLayout rlnodata1;
    private RelativeLayout rlnotif1;
    private Button getRecieverListButton;
    private Button confirmOrder;

    private FloatingActionButton recieverRefreshButton;


    private RelativeLayout listRelativeLayout;
    private ArrayList<RecieveOrdersModel> orders;
    private RecieverAdapter adapter;
    private User loginUser;
    private View getView;
    @Override
    public View onCreateView(final LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        getView = inflater.inflate(R.layout.fragment_recieved_orders, container, false);
        context = getContext();
        listItem = new ArrayList<>();
        orders = new ArrayList<>();




        editText = getView.findViewById(R.id.enter_agent_id);
        getTransactionsList = getView.findViewById(R.id.get_transactions_list);
        getTransactionsList.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                getRecieverData(editText.getText().toString());
            }
        });



        recieverRefreshButton = getView.findViewById(R.id.reciever_refresh_button);
        recieverRefreshButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                getRecieverData();
                Toast.makeText(context,"Refreshed!",Toast.LENGTH_SHORT).show();
            }
        });

        shimmer = getView.findViewById(R.id.shimmerwallet1);
        recyclerView = getView.findViewById(R.id.inboxlist1);
        rlnodata1 = getView.findViewById(R.id.rlnodata1);
        rlnotif1 = getView.findViewById(R.id.rlnotif1);

        Toolbar toolbar = getView.findViewById(R.id.toolbar1);
        toolbar.setVisibility(View.VISIBLE);


         loginUser = BaseApp.getInstance(context).getLoginUser();
         Log.d("TAG",loginUser.getId());

        databaseHelper = new DatabaseHelper(getActivity());



    //    recyclerView.setHasFixedSize(true);
        recyclerView.setNestedScrollingEnabled(false);
        recyclerView.setLayoutManager(new GridLayoutManager(getActivity(), 1));
        MyAdapterListener myAdapterListener = new MyAdapterListener() {
            @Override
            public void confirmButtonViewOnClick(View v, int position) {
                confirmOrder(position);

            }
        };
        adapter = new RecieverAdapter(orders, context, myAdapterListener,rlnotif1 );
        recyclerView.setAdapter(adapter);


        /*
        listRelativeLayout = getView.findViewById(R.id.list_relative_layout);
        listRelativeLayout.setVisibility(View.GONE);

             */

/*
        getRecieverListButton = getView.findViewById(R.id.get_reciever_list1);
        getRecieverListButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                listRelativeLayout.setVisibility(View.VISIBLE);
               getRecieverData();
               adapter.addAll(orders);
            }
        });
*/
      /*  confirmOrder = getView.findViewById(R.id.confirm_orders_recieved);
        confirmOrder.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                confirmOrder();
            }
        });
*/

     //   displayData();

        return getView;
    }


    private void shimmershow() {
        Log.d("TAG","inside shimmershow");
        recyclerView.setVisibility(View.GONE);
        shimmer.setVisibility(View.VISIBLE);
        shimmer.startShimmerAnimation();

    }

    private void shimmertutup() {
        recyclerView.setVisibility(View.VISIBLE);
        shimmer.setVisibility(View.GONE);
        shimmer.stopShimmerAnimation();
    }



/*
    @Override
    public void onResume() {
        super.onResume();
        User loginUser = BaseApp.getInstance(context).getLoginUser();
        if (databaseHelper.getFavouriteByMyid(loginUser.getId())) {
            listItem = databaseHelper.getFavourite();
        }
        displayData();
    }
*/

    @Override
    public void onResume() {
        super.onResume();

        Log.d("TAG","inside onResume");

        displayData();

    }


    private void displayData() {



        // FavouriteItem adapter = new FavouriteItem(getActivity(), listItem, R.layout.item_grid_full);
        //  getRecieverListButton.setText("Changed");

        getRecieverData();





      //  adapter.updateAll(orders);
       /* if (adapter.getItemCount() == 0) {
            recyclerView.setVisibility(View.GONE);
            rlnodata1.setVisibility(View.VISIBLE);
        } else {
            recyclerView.setVisibility(View.VISIBLE);
            rlnodata1.setVisibility(View.GONE);
        }
*/
    }


    public void getRecieverData(){
        shimmershow();
        final JSONObject jsonObject = new JSONObject();

        Log.d("TAG","inside get reciever");

        try{
         // jsonObject.put("agent_id","P1624691359");
          jsonObject.put("agent_id",loginUser.getId());
          //   jsonObject.put("agent_id","P1630573622");

        } catch (JSONException e){
            e.printStackTrace();

        }

        String url = Constant.CONNECTION+"driver/receiver_orders_list/";
        // Build the request
        final JsonObjectRequest jsonObjectRequest = new
                JsonObjectRequest(Request.Method.POST, url,
                        jsonObject, new Response.Listener<JSONObject>
                        () {
                    @Override
                    public void onResponse(@NonNull JSONObject
                                                   response) {
                        // Api call succeeded
                       shimmertutup();
                        Log.d("TAG","Api call succeeded");


                        try {
                            if (response.getJSONArray("data").isNull(0)) {
                                recyclerView.setVisibility(View.GONE);
                                rlnodata1.setVisibility(View.VISIBLE);
                                Log.d("TAG","inside get reciever if condition");

                            } else {
                                recyclerView.setVisibility(View.VISIBLE);
                                rlnodata1.setVisibility(View.GONE);
                                Log.d("TAG","inside get reciever else condition");

                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

                        Log.d("TAG", "Inside onResponse, api call succeeded");


                        orders = new ArrayList<>();

                        try {
                            JSONArray data = response.getJSONArray("data");

                            for(int i = 0; i < data.length(); i++){

                                RecieveOrdersModel order = new RecieveOrdersModel();

                                JSONObject jsonObjectData = data.getJSONObject(i);


                                order.setService(jsonObjectData.getString("service"));


                                order.setTransaction_id(jsonObjectData.getString("transaction_id"));

                                order.setStatus(Integer.parseInt(jsonObjectData.getString("status")));

                               // Log.d("TAG","Transaction_id :"+jsonObjectData.getString("transaction_id")
                                  //      +" Status :"+order.getStatus());
                                orders.add(order);

                            }


                            adapter.updateAll(orders);
                          //  shimmertutup();

                        } catch (JSONException e) {
                            e.printStackTrace();
                        }



                    }
                }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(@NonNull VolleyError
                                                        error) {
                        // Api call failed
                        error.printStackTrace();
                        // Show the error to the user

                        shimmertutup();
                        recyclerView.setVisibility(View.GONE);
                        rlnodata1.setVisibility(View.VISIBLE);

                        Log.d("TAG",error.toString()+"     inside onerroerresponse");


                    }
                }) {
                    @NonNull
                    @Override
                    public Map<String, String> getHeaders() throws
                            AuthFailureError {
                        // Build the headers

                        final Map<String, String> headers = new
                                HashMap<>();
                        headers.put("Content-Type",
                                "application/json");


                        String USERNAME = "Admin";
                        String PASSWORD = "Admin";
                        // add headers <key,value>
                        String credentials = USERNAME+":"+PASSWORD;
                        String auth = "Basic "
                                + Base64.encodeToString(credentials.getBytes(),
                                Base64.NO_WRAP);
                        headers.put("Authorization", auth);
                        return headers;
                    }
                };
           // Make the request
        Volley.newRequestQueue(context).add(jsonObjectRequest);

    }


    public void confirmOrder(int position){



             JSONObject jsonObject = new JSONObject();
            try{
                String value = orders.get(position).getTransaction_id();

                Log.d("TAG",orders.get(position).getTransaction_id());
              //  jsonObject.put("transaction_id","171");
                jsonObject.put("transaction_id",value);

            } catch (JSONException e){
                e.printStackTrace();

            }

            String url = Constant.CONNECTION + "driver/receive";
            JsonObjectRequest jsonObjectRequest = new
                    JsonObjectRequest(Request.Method.POST, url,
                            jsonObject, new Response.Listener<JSONObject>
                            () {
                        @Override
                        public void onResponse(@NonNull JSONObject
                                                       response) {
                            // Api call succeeded

                            Log.d("TAG", response.toString());
                            Timber.tag("TAG").d(response.toString());

                        }
                    }, new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(@NonNull VolleyError
                                                            error) {
                            // Api call failed
                            error.printStackTrace();
                            // Show the error to the user

                        }
                    }) {
                        @NonNull
                        @Override
                        public Map<String, String> getHeaders() throws
                                AuthFailureError {
                            // Build the headers

                            final Map<String, String> headers = new
                                    HashMap<>();
                            headers.put("Content-Type",
                                    "application/json");


                            String USERNAME = "Admin";
                            String PASSWORD = "Admin";
                            // add headers <key,value>
                            String credentials = USERNAME+":"+PASSWORD;
                            String auth = "Basic "
                                    + Base64.encodeToString(credentials.getBytes(),
                                    Base64.NO_WRAP);
                            headers.put("Authorization", auth);
                            return headers;
                        }
                    };

            // Make the request
            Volley.newRequestQueue(context).add(jsonObjectRequest);

        Toast.makeText(context,"Total Orders Received = "+orders.toArray().length+"\nSuccess!",Toast.LENGTH_LONG).show();
        //Toast.makeText(context,"Success!",Toast.LENGTH_SHORT).show();
    }



    public void getRecieverData(String agentId){
        shimmershow();
        final JSONObject jsonObject = new JSONObject();

        Log.d("TAG","inside get reciever");

        try{
            jsonObject.put("agent_id",agentId);
            //jsonObject.put("agent_id",loginUser.getId());
            //   jsonObject.put("agent_id","P1630573622");

        } catch (JSONException e){
            e.printStackTrace();

        }

        // Build the request
        final JsonObjectRequest jsonObjectRequest = new
                JsonObjectRequest(Request.Method.POST, "http://slogfy.xyz/api/driver/receiver_orders_list/",
                        jsonObject, new Response.Listener<JSONObject>
                        () {
                    @Override
                    public void onResponse(@NonNull JSONObject
                                                   response) {
                        // Api call succeeded
                        shimmertutup();
                        Log.d("TAG","Api call succeeded");


                        try {
                            if (response.getJSONArray("data").isNull(0)) {
                                recyclerView.setVisibility(View.GONE);
                                rlnodata1.setVisibility(View.VISIBLE);
                                Log.d("TAG","inside get reciever if condition");

                            } else {
                                recyclerView.setVisibility(View.VISIBLE);
                                rlnodata1.setVisibility(View.GONE);
                                Log.d("TAG","inside get reciever else condition");

                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

                        Log.d("TAG", "Inside onResponse, api call succeeded");


                        orders = new ArrayList<>();

                        try {
                            JSONArray data = response.getJSONArray("data");

                            for(int i = 0; i < data.length(); i++){

                                RecieveOrdersModel order = new RecieveOrdersModel();

                                JSONObject jsonObjectData = data.getJSONObject(i);


                                order.setService(jsonObjectData.getString("service"));


                                order.setTransaction_id(jsonObjectData.getString("transaction_id"));


                                orders.add(order);

                            }


                            adapter.updateAll(orders);
                            //  shimmertutup();

                        } catch (JSONException e) {
                            e.printStackTrace();
                        }



                    }
                }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(@NonNull VolleyError
                                                        error) {
                        // Api call failed
                        error.printStackTrace();
                        // Show the error to the user

                        shimmertutup();
                        recyclerView.setVisibility(View.GONE);
                        rlnodata1.setVisibility(View.VISIBLE);

                        Log.d("TAG",error.toString()+"     inside onerroerresponse");


                    }
                }) {
                    @NonNull
                    @Override
                    public Map<String, String> getHeaders() throws
                            AuthFailureError {
                        // Build the headers

                        final Map<String, String> headers = new
                                HashMap<>();
                        headers.put("Content-Type",
                                "application/json");


                        String USERNAME = "Admin";
                        String PASSWORD = "Admin";
                        // add headers <key,value>
                        String credentials = USERNAME+":"+PASSWORD;
                        String auth = "Basic "
                                + Base64.encodeToString(credentials.getBytes(),
                                Base64.NO_WRAP);
                        headers.put("Authorization", auth);
                        return headers;
                    }
                };
        // Make the request
        Volley.newRequestQueue(context).add(jsonObjectRequest);

    }



}
