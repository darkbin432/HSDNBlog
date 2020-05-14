package com.hznu.utils;

import java.io.InputStream;

class MyPrintStream extends Thread {
    InputStream iStream = null;

    public MyPrintStream(InputStream iStream) {
        this.iStream = iStream;
    }

    @Override
    public void run() {
        try {
            int r = 0;
            while ((r = iStream.read()) != -1) {
                System.out.print((char) (r));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}