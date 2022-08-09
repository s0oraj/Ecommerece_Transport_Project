package com.slog.agentassignment.item;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Handler;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.slog.agentassignment.R;
import com.slog.agentassignment.models.RecieveOrdersModel;

import java.util.List;



public class RecieverAdapter extends RecyclerView.Adapter<RecieverAdapter.ViewHolder> {

    private List<RecieveOrdersModel> orders;
    private Context context;
    public MyAdapterListener onClickListener;
    private RelativeLayout rlnotif1;


    public interface MyAdapterListener {
        void confirmButtonViewOnClick(View v, int position);
    }


    public RecieverAdapter(List<RecieveOrdersModel> orders, Context context, MyAdapterListener listener, RelativeLayout rlnotif1) {
        this.orders = orders;
        this.onClickListener = listener;
        this.context = context;
        this.rlnotif1 = rlnotif1;
    }

    /**
     *Constructs a new viewholder
     * */
    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.recieved_orders_view,parent,false);

        return new ViewHolder(v);
    }


    /**
     * Binds view holder
     * **/
    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {

        RecieveOrdersModel order = orders.get(position);
        holder.transactionView.setText(order.getTransaction_id());
        holder.serviceView.setText(order.getService());

        switch (order.getStatus()){
            case 0:
                holder.statusView.setText("Not Started");
                holder.statusView.setTextColor(context.getResources().getColor(R.color.red));
                break;
            case 1:
                holder.statusView.setText("Found Driver");
                holder.statusView.setTextColor(context.getResources().getColor(R.color.black));
                break;
            case 2:
                holder.statusView.setText("Driver Found");
                holder.statusView.setTextColor(context.getResources().getColor(R.color.black));
                break;
            case 3:
                holder.statusView.setText("Process");
                holder.statusView.setTextColor(context.getResources().getColor(R.color.black));
                break;
            case 4:
                holder.statusView.setText("Complete");
                holder.statusView.setTextColor(context.getResources().getColor(R.color.green));
                break;
                // case 5 and case 6 should not exist normally,
                // but if there is an error from server side,
                //then "cancel" & "received" will highlight it
            case 5:
                holder.statusView.setText("Cancel");
                holder.statusView.setTextColor(context.getResources().getColor(R.color.black));
                break;
            case 6:
                holder.statusView.setText("Recieved");
                holder.statusView.setTextColor(context.getResources().getColor(R.color.black));
                break;
        }

        boolean isVisible = order.getVisibility();
        holder.expandableLayout.setVisibility(isVisible? View.VISIBLE : View.GONE);
        holder.viewMoreButton.setImageResource(
                isVisible? R.drawable.ic_baseline_arrow_drop_up_24
                        : R.drawable.ic_baseline_arrow_drop_down_24 );

    }


    @Override
    public int getItemCount() {
        return orders.size();
    }


    /**
     * Helper method which clears the existing dataset of the recyclerview adapter.
     *
    public void clear(){
        if(orders !=null && !orders.isEmpty()) {
            int size = orders.size();
            orders.clear();

            // Notify the adapter that items were removed so adapter can update the recyclerview accordingly.
            notifyItemRangeRemoved(0, size);
        }

    } */


    public void addAll(List<RecieveOrdersModel> data){
        if (data != null && !data.isEmpty()) {
            // If new data is not empty then update orders List
            orders = data;
            //Notify the adapter for the change in dataset
            notifyDataSetChanged();
        }
        else{


            Log.d("TAG","inside recieveradapter addall else condition");

        }
    }

    public void updateAll(List<RecieveOrdersModel> data){

            // Update the current dataset with new dataset
            orders = data;
            //Notify the adapter for the change in dataset
            notifyDataSetChanged();

    }





    public class ViewHolder extends RecyclerView.ViewHolder {

        TextView transactionView;
        TextView serviceView;
        TextView statusView;
        ImageButton viewMoreButton;
        Button closeReceivedOrder;
        Button confirmReceivedOrder;
        LinearLayout expandableLayout;

        LinearLayout expandReceivedLayout;



        View view;
        public ViewHolder(@NonNull View itemView) {
            super(itemView);

            view = itemView;
            serviceView = itemView.findViewById(R.id.service_view);
            transactionView = itemView.findViewById(R.id.transaction_view);
            statusView = itemView.findViewById(R.id.status_view);

            viewMoreButton = itemView.findViewById(R.id.view_more_btn);
            expandableLayout =itemView.findViewById(R.id.confirm_and_close_layout);
            expandReceivedLayout =itemView.findViewById(R.id.expand_received_item);
            closeReceivedOrder = itemView.findViewById(R.id.close_received_order);
            confirmReceivedOrder = itemView.findViewById(R.id.confirm_received_order);


            confirmReceivedOrder.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {

                    showConfirmSendDialog(v,getAbsoluteAdapterPosition());
                }
            });

            closeReceivedOrder.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    RecieveOrdersModel order = orders.get(getAbsoluteAdapterPosition());
                    order.setVisibility(!order.getVisibility());
                    notifyItemChanged(getAbsoluteAdapterPosition());
                }
            });

            expandReceivedLayout.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    RecieveOrdersModel order = orders.get(getAbsoluteAdapterPosition());
                    order.setVisibility(!order.getVisibility());
                    notifyItemChanged(getAbsoluteAdapterPosition());
                }
            });

            viewMoreButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    RecieveOrdersModel order = orders.get(getAbsoluteAdapterPosition());
                    order.setVisibility(!order.getVisibility());
                    notifyItemChanged(getAbsoluteAdapterPosition());
                }
            });


        }
    }





    public void showConfirmSendDialog (View v, int position){

        if(orders.get(position).getStatus()<4){
            notif("Transaction status must be completed first in order to confirm receiving of the order");
        }
        else {

            // Create an AlertDialog.Builder and set the message, and click listeners
            // for the positive and negative buttons on the dialog.
            AlertDialog.Builder builder = new AlertDialog.Builder(context, AlertDialog.THEME_HOLO_LIGHT);
            builder.setMessage("Confirm Received?");
            builder.setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialogInterface, int i) {
                    // User clicked Yes

                    onClickListener.confirmButtonViewOnClick(v, position);
                    // Remove the received order from the list after confirm button is clicked
                    orders.remove(position);
                    notifyItemRemoved(position);


                }
            });
            builder.setNegativeButton("No", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialogInterface, int i) {
                    if (dialogInterface != null) {
                        dialogInterface.dismiss();
                    }

                }
            });

            // Create and show the AlertDialog
            AlertDialog alertDialog = builder.create();
            alertDialog.show();

            //alertDialog.getWindow().getDecorView().getBackground().setColorFilter(Color.GREEN, PorterDuff.Mode.SRC);
        }
    }

    private void notif(String text) {
        rlnotif1.setVisibility(View.VISIBLE);
        TextView textnotif1 = rlnotif1.findViewById(R.id.textnotif1);
        textnotif1.setText(text);

        new Handler().postDelayed(() -> rlnotif1.setVisibility(View.GONE), 3000);
    }


}
