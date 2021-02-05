package com.example.native_flutter_test;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterEngineConfigurator;
import io.flutter.embedding.android.FlutterEngineProvider;
import io.flutter.embedding.android.FlutterFragment;
import io.flutter.embedding.android.FlutterFragmentActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.util.GeneratedPluginRegister;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class flutter_fragment extends FragmentActivity implements FlutterEngineConfigurator {

    private static final String TAG_FLUTTER_FRAGMENT = "flutter_fragment";
    private FlutterFragment flutterFragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_flutter_fragment);

        FragmentManager fragmentManager = getSupportFragmentManager();
        flutterFragment = (FlutterFragment) fragmentManager
                .findFragmentByTag(TAG_FLUTTER_FRAGMENT);

//        flutterFragment = FlutterFragment.withNewEngine().shouldAttachEngineToActivity(false).build();
        if (flutterFragment == null) {
            Log.d("isFlutterFragment", "onCreate: "+flutterFragment);
            flutterFragment = FlutterFragment.createDefault();
//            flutterFragment.shouldAttachEngineToActivity();

            fragmentManager
                    .beginTransaction()
                    .add(
                            R.id.flutter_fragment_container,
                            flutterFragment,
                            TAG_FLUTTER_FRAGMENT
                    )
                    .commit();
        }

    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegister.registerGeneratedPlugins(flutterEngine);
    }

    @Override
    public void cleanUpFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    }

//    @Nullable
//    @Override
//    public FlutterEngine provideFlutterEngine(@NonNull Context context) {
//        return null;
//    }

//    @Override
//    public void configureFlutterEngine(FlutterEngine flutterEngine) {
//        GeneratedPluginRegistrant.registerWith(flutterEngine);
//    }
}