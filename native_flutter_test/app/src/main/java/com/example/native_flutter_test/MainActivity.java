package com.example.native_flutter_test;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterActivityLaunchConfigs;
import io.flutter.embedding.android.FlutterFragment;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;

public class MainActivity extends AppCompatActivity {

    private FlutterEngine flutterEngine;
    public static final String engineid  = "flutterEngine";

    private static final String TAG_FLUTTER_FRAGMENT = "flutter_fragment";
    private FlutterFragment flutterFragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

//        FragmentManager fragmentManager = getSupportFragmentManager();
//        flutterFragment = (FlutterFragment) fragmentManager
//                .findFragmentByTag(TAG_FLUTTER_FRAGMENT);
//        if (flutterFragment == null) {
//            flutterFragment = FlutterFragment.createDefault();
//
//            fragmentManager
//                    .beginTransaction()
//                    .add(
//                            R.id.fragment_container,
//                            flutterFragment,
//                            TAG_FLUTTER_FRAGMENT
//                    )
//                    .commit();
//        }

//        flutterEngine = new FlutterEngine(this);
//        flutterEngine.getDartExecutor().executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault());
//        FlutterEngineCache.getInstance().put(engineid,flutterEngine);
//        FlutterFragment flutterFragment =  FlutterFragment.createDefault();
//        getSupportFragmentManager().beginTransaction()
//                .add(R.id.fragment_container,flutterFragment).commit();

        Button jumpbtn = this.findViewById(R.id.jump);
        jumpbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
//                startActivity(
//                        FlutterActivity.withCachedEngine(engineid)
//                        .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
//                        .build(v.getContext())
//                );
                startActivity(FlutterActivity.createDefaultIntent(v.getContext()));
            }
        });

        Button jumpFragment = this.findViewById(R.id.jump_fragment);
        jumpFragment.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent it = new Intent();
                it.setAction("android.intent.action.FLUTTER_FRAGMENT");

                startActivity(it);
            }
        });



    }
}