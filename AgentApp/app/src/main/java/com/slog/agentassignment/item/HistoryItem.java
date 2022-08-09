package com.slog.agentassignment.item;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.slog.agentassignment.R;
import com.slog.agentassignment.activity.ProgressActivity;
import com.slog.agentassignment.constants.Constant;
import com.slog.agentassignment.models.AllTransModel;
import com.slog.agentassignment.utils.PicassoTrustAll;
import com.slog.agentassignment.utils.Utility;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

/**
 * Created by otacodes on 3/24/2019.
 */

public class HistoryItem extends RecyclerView.Adapter<HistoryItem.ItemRowHolder> {

    private List<AllTransModel> dataList;
    private Context mContext;
    private int rowLayout;


    public HistoryItem(Context context, List<AllTransModel> dataList, int rowLayout) {
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
        final AllTransModel singleItem = dataList.get(position);

        holder.text.setText("Order " + singleItem.getFitur());

        Utility.currencyTXT(holder.nominal, singleItem.getBiayaakhir(), mContext);
        holder.description.setText(singleItem.getStatustransaksi());


        SimpleDateFormat timeFormat = new SimpleDateFormat("dd MMM yyyy", Locale.US);
        String finalDate = timeFormat.format(singleItem.getWaktuOrder());
        holder.tanggal.setText(finalDate);


        // Code change made on 3/08/22
        holder.orderTransactionView.setText(singleItem.getIdTransaksi());



//
//        Glide.with(mContext)
//                .load(Constant.IMAGESORDER + singleItem.getOrderimage())
//                .override(Target.SIZE_ORIGINAL, Target.SIZE_ORIGINAL)
//                .listener(new RequestListener<Drawable>() {
//                    @Override
//                    public boolean onLoadFailed(@Nullable GlideException e, Object model, Target<Drawable> target, boolean isFirstResource) {
//                        return false;
//                    }
//
//                    @Override
//                    public boolean onResourceReady(Drawable resource, Object model, Target<Drawable> target, DataSource dataSource, boolean isFirstResource) {
//                        return false;
//                    }
//                }).into(holder.images);

//        Glide.with(mContext)
//                .asBitmap()
//                .apply(RequestOptions.circleCropTransform())
//                .load(Constant.IMAGESORDER + singleItem.getOrderimage())
//                .placeholder(R.drawable.image_placeholder)
//                .into(holder.images);


        PicassoTrustAll.getInstance(mContext)
                .load(Constant.IMAGESORDER + singleItem.getOrderimage())
                .resize(50,50)
                .placeholder(R.drawable.image_placeholder)
                .into(holder.images);


        if (singleItem.status == 4 && singleItem.getRate().isEmpty()) {
            holder.description.setTextColor(mContext.getResources().getColor(R.color.black));
            holder.nominal.setTextColor(mContext.getResources().getColor(R.color.colorgradient));
//            holder.background.setBackground(mContext.getResources().getDrawable(R.drawable.btn_rect));
            holder.itemlayout.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent i = new Intent(mContext, ProgressActivity.class);
                    i.putExtra("driver_id", singleItem.getIdDriver());
                    i.putExtra("transaction_id", singleItem.getIdTransaksi());
                    i.putExtra("complete", "true");
                    i.putExtra("response", String.valueOf(singleItem.status));
                    i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
                    mContext.startActivity(i);

                }
            });
        } else if (singleItem.status == 5) {
            holder.description.setTextColor(mContext.getResources().getColor(R.color.black));
            holder.nominal.setTextColor(mContext.getResources().getColor(R.color.red));
//            holder.background.setBackground(mContext.getResources().getDrawable(R.drawable.btn_rect_red));
            holder.itemlayout.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent i = new Intent(mContext, ProgressActivity.class);
                    i.putExtra("driver_id", singleItem.getIdDriver());
                    i.putExtra("transaction_id", singleItem.getIdTransaksi());
                    i.putExtra("complete", "true");
                    i.putExtra("response", String.valueOf(singleItem.status));
                    i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
                    mContext.startActivity(i);

                }
            });
        } else {
            holder.description.setTextColor(mContext.getResources().getColor(R.color.black));
            holder.nominal.setTextColor(mContext.getResources().getColor(R.color.colorgradient));
//            holder.background.setBackground(mContext.getResources().getDrawable(R.drawable.btn_rect));
            holder.itemlayout.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent i = new Intent(mContext, ProgressActivity.class);
                    i.putExtra("driver_id", singleItem.getIdDriver());
                    i.putExtra("transaction_id", singleItem.getIdTransaksi());
                    i.putExtra("response", String.valueOf(singleItem.status));
                    i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
                    mContext.startActivity(i);

                }
            });
        }
    }
    @Override
    public int getItemCount() {
        return (null != dataList ? dataList.size() : 0);
    }

    static class ItemRowHolder extends RecyclerView.ViewHolder {
        TextView text, tanggal, nominal, description, orderTransactionView;
        ImageView images,background;
        RelativeLayout itemlayout;

        ItemRowHolder(View itemView) {
            super(itemView);
//            background = itemView.findViewById(R.id.background);
            images = itemView.findViewById(R.id.imagephoto);
            text = itemView.findViewById(R.id.text);
            tanggal = itemView.findViewById(R.id.texttanggal);
            nominal = itemView.findViewById(R.id.price);
            description = itemView.findViewById(R.id.textket);
            itemlayout = itemView.findViewById(R.id.mainlayout);


            // Code change made on 3/08/22
            orderTransactionView = itemView.findViewById(R.id.order_transaction_view);


        }
    }


}
