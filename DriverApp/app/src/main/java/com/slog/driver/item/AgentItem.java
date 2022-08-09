package com.slog.driver.item;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.slog.driver.R;
import com.slog.driver.activity.AgentOrders;
import com.slog.driver.activity.OrderDetailActivity;
import com.slog.driver.constants.Constant;
import com.slog.driver.models.AllAgentModel;
import com.slog.driver.models.AllAgentModel;
import com.slog.driver.utils.PicassoTrustAll;
import com.slog.driver.utils.Utility;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

/**
 * Created by otacodes on 3/24/2019.
 */

public class AgentItem extends RecyclerView.Adapter<AgentItem.ItemRowHolder> {

    private List<AllAgentModel> dataList;
    private Context mContext;
    private int rowLayout;


    public AgentItem(Context context, List<AllAgentModel> dataList, int rowLayout) {
        this.dataList = dataList;
        this.mContext = context;
        this.rowLayout = rowLayout;

    }


    @NonNull
    @Override
    public ItemRowHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(rowLayout, parent, false);
        return new ItemRowHolder(v);
    }

    @SuppressLint("SetTextI18n")
    @Override
    public void onBindViewHolder(@NonNull final ItemRowHolder holder, final int position) {
        final AllAgentModel singleItem = dataList.get(position);
        holder.text.setText("" + singleItem.getAgent2_customer_fullname());
        holder.nominal.setText("" + singleItem.getAgent2_phone_number());

        holder.tanggal.setText(singleItem.getAgent2_address());
        holder.description.setText(singleItem.getOrders());


        holder.itemlayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(mContext, AgentOrders.class);
                i.putExtra("agent_id", singleItem.getId());
                i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
                mContext.startActivity(i);
            }
        });


    }

    @Override
    public int getItemCount() {
        return (null != dataList ? dataList.size() : 0);
    }

    static class ItemRowHolder extends RecyclerView.ViewHolder {
        TextView text, tanggal, nominal, description;
        RelativeLayout itemlayout;

        ItemRowHolder(View itemView) {
            super(itemView);
            text = itemView.findViewById(R.id.text);
            tanggal = itemView.findViewById(R.id.texttanggal);
            nominal = itemView.findViewById(R.id.price);
            description = itemView.findViewById(R.id.textket);
            itemlayout = itemView.findViewById(R.id.mainlayout);
        }
    }


}
