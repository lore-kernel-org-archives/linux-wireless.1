Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910463;
	b=JrBz8nIlDpLFHxuX7JRYLY9tZRVamQpDmYXLQI0HYnA4uFLoftBmT/EOWztqVbjLUNXV
	 4U8Bi9Ge5thktZtJk7708qPRWec99+z5WaFP2L3hyStY5/Sxl10/G3cXC3NWFi0wFj9pZ
	 51K4T1Bc3ckaNGXzL8BAIDslJEN5lqjla757HrJGHdD8WnUGKazQVqGIo6E+MudSjuVTT
	 5upTql35Ver45XRHtojvanPEWaCouHFQPvSsV8/OadMDLlardjsBbkwUtpfiRlrV8pCs4
	 ozHFoYmiGZbM/i2Jz4WcCuOYcEYO78UwJUOD4Z8Mg4Pfz18qV47aQElvTFF1cwrV6JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=joWruevNIesCytV8o+CO4RtGm9+XqvDSkL54ZPCtAuk=;
	b=cRgpVVGwavplFdnCdq7CDUO7JTVGLZjVv1mMM2dUhflwz5cxsNyxpMLnfR+SaMbUHE4c
	 /ftH8exiPSjKXzUE1ox79jzfq5n6H2omUDm3BycZZ8rH0NRLtdI5TzQ/tOQ8eEz02MZVI
	 3fuCy7WNTgjbj9sFYNZYGqypbbliB9PHNMAtdiRjmL1uU4LNcHYH3mDwzbBdib7jPIQdq
	 wfvNaXD/iqRcoTePHb3o43bR3nNjIjWLz+enXy+m4x6rgk90NMiw49Phxh/ff7dnY9Rso
	 aKsyCzDcT8ysGiY3gVN9wn1zCd8tnQWgOH3wEwiwaoqOWvhu2HeeY+X/0yWSCNyzI/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yhS1qp23;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86E3606A89F
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 10:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E86E3606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yhS1qp23
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso26673115e9.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 02:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794910461; x=1795515261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=joWruevNIesCytV8o+CO4RtGm9+XqvDSkL54ZPCtAuk=;
        b=yhS1qp23M+mmxHrugalt5Q/GaWMbIuu+dXwcAIfZh2KJPbXtZughu3Etnu4qB5iUjF
         k3J+K9k/FbMYCiUA5DfIT5404WdLBj18sznTJSoLDBPF79lvats3Hjd06j7dzapZI2lt
         X4ZsUa98yui5lqKPEgSUvpdyW1bV+re82UXYEq6GZEryBCO/iGFLktEYwN2FSuDA2utv
         LiD65JxRNKIVq0Iu90jilhPlKH6QisxAmHI2ym+ol2FDo9dtaYZljhtYBI00VRwI3R7z
         zbgeuSdtmEUwmEroNXKcJqnAAQLlme2xoEKgv+wOZz8B/SpJI/+W78OEud5nSgdF7Hgv
         K5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910461; x=1795515261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=joWruevNIesCytV8o+CO4RtGm9+XqvDSkL54ZPCtAuk=;
        b=C+0e4w7Sp5leXFOYfPJ1LVbgx/AOTgiZvwLmEYK6wBpIwUwHJArYHjSuT5/gn02VAv
         FuvjtKy1jkMG6GxTsa3/7Nm72DTe1lFv8rRJnnYQq5mUrvFwl0DcA1iwfDd0N6IX6FYs
         KdBAe/v2EEczMM4wjfZ/+kV6EPpCvbs8jM3ONMaoQ4jzwByHueOl+IDf9MaYSMv+rBjI
         /0SeXDMI8ARr/9J0qeGtCcgZMPN5iMMA9AUqF03SF2cfivawFy6ajVv0GRaGTpIEELIU
         9TZIIkrVtTA2MORiPQUtlvWjxuIm9fLxK2+H6dQ+aBtNnAUlKCiE7I9V3I9zH4DwJxIr
         7P8Q==
X-Forwarded-Encrypted: i=1; AL+hErFcLtKtiRy8qJUaXAFK0qQwDZ8HsUHx98St3X19EvwF8FH/PYgR+eC9xN8/x9w18OJUkXn7bdLQi+6mtBxv8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8nroV+Mkwb3QIsa3R80lfnls/IKMbsa3Pb6T363LFw1ofBVtHB
	QgApM/jQHEMeItrhlCNExLbMNAdENviZtviWhOCPJn7lXRdWHm2UwMym
X-Gm-Gg: AYBFou29FYVTk8M9RyfvLWmN/Y/Oo7AHsGu0y5GT4kqJcmNYAP8FINBnRnbSSTitdP7
	vHKMC03OfFh7dfi193a6XORG8Amfew9erMeUGuCXuzhkSRTXIjH+IW7Ezt838RNrJYhIcw/QPvu
	VnSKEDuM/cZuD9GUmZna/3pb62bZGF2XSqF7lsj9TqiG/9Rx2uo1KYOzdR5XOug3+gukCDEHoE/
	WJJtLGxm5rJ3kCo8fiexqPTvCXTu++NDXetLbJ1gBISEoEQh8Ue+UDjscNYvMjuUjm5AHsC7U+I
	YP9oV3KhKc+8beLSuWLN7zFopHc5fs7TSLgMic/MmDrka78I03SiOVhyypTondpMP1p4dbrTBKy
	uV9cecMAsrKsYLBimm0SvH7kqz9ScZqliI0qNsfobmLIYzGZKSpqIaS1yAR09KDzDV9d3+tfRSZ
	bRnysacxA8QUGOT6KknE/JR77bK2KKiLZXmFgosjiXDStLtV5RCRufpujsrX3ol+ffdGZpbF8/u
	CjKn+Zrh2W6aMOLlMYDHRMHEGL3US/tCoFKrUrdfaFJ6abF5wuryT3XhPHfYo7m9/wx9Kn8canD
	JaJ64dmjnOLDBQkvPywPGPXF1Ig8p/27cMo=
X-Received: by 2002:a05:600c:c4a3:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4bb55ab5526mr288666335e9.34.1794910461178;
        Tue, 17 Nov 2026 02:14:21 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm54575775e9.14.2026.11.17.02.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:14:20 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2] wifi: rtw88: program the beacon interval
Date: Tue, 17 Nov 2026 11:14:19 +0100
Message-ID: <20261117101419.1687892-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The driver never writes the beacon interval register, so the hardware
keeps its default of 100 TU. An AP or IBSS started with another
interval says that interval in its beacons and sends them 100 TU apart.

With beacon_int=200 in hostapd the beacons of an RTL8822CE, RTL8822CU,
RTL8822BU and RTL8821CU are 102.4 ms apart on the air. The same holds
for an IBSS joined with a beacon interval of 200 on an RTL8822CE and
RTL8822BU.

Write the interval when mac80211 sets it for an AP or IBSS interface.
Both beacon from port 0: rtw_core_port_switch() moves an AP there, and
an IBSS interface is never combined with another one.

Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/1D396970-35B7-4B0B-82E9-24B523AD69C2@linux.dev/
Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v2:
    - write the interval for an AP or IBSS interface only (Ping-Ke)
    - Luka's Reviewed-by not carried, the condition changed
    - rebased on rtw-next fb51e39dfaea
    
    Tested on rtw-next on an RTL8822CE, RTL8822CU, RTL8822BU and RTL8821CU
    as AP with hostapd, the beacons sniffed from a second machine: with
    beacon_int 50, 100 and 200 they are 51.2, 102.4 and 204.8 ms apart on
    the air. As IBSS on the RTL8822CE and RTL8822BU, joined with a beacon
    interval of 50 and 200, the TSF of their beacons shows them 50 and 200
    TU apart. AP, association, power save, firmware crash and scan tests on
    the RTL8822BU and RTL8821CU on both bands gave no new kernel report.
    
    v1: https://lore.kernel.org/r/20261116072022.1142783-1-mehmet.fide@gmail.com/

 drivers/net/wireless/realtek/rtw88/mac80211.c | 5 +++++
 drivers/net/wireless/realtek/rtw88/reg.h      | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 5e40cf06a9e3..26bc4a9913be 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -432,6 +432,11 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & BSS_CHANGED_BEACON_INT) {
 		if (ieee80211_vif_type_p2p(vif) == NL80211_IFTYPE_STATION)
 			coex_stat->wl_beacon_interval = conf->beacon_int;
+		else if ((vif->type == NL80211_IFTYPE_AP ||
+			  vif->type == NL80211_IFTYPE_ADHOC) &&
+			 rtwvif->port == RTW_PORT_0)
+			rtw_write16(rtwdev, REG_MBSSID_BCN_SPACE,
+				    conf->beacon_int);
 	}
 
 	if (changed & BSS_CHANGED_BEACON) {
diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index afcdb66fdb9a..877b82640e91 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -498,6 +498,7 @@
 #define BIT_EN_BCN_FUNCTION	BIT(3)
 #define BIT_EN_TXBCN_RPT	BIT(2)
 #define REG_BCN_CTRL_CLINT0	0x0551
+#define REG_MBSSID_BCN_SPACE	0x0554
 #define REG_DRVERLYINT		0x0558
 #define REG_BCNDMATIM		0x0559
 #define REG_ATIMWND		0x055A

base-commit: fb51e39dfaea5b5990e783e53c657534a37987d6
-- 
2.56.0

