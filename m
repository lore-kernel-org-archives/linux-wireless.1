Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935409;
	b=0PdTEBXmSf0GAnnOfibQb2ozSisHlFDSN8RTWbeXsn6MYRFkO1r84JFJS32pPvjDsRJb
	 UmPeWsWRZJJxS58Je3IeMR0LgDrGnOWIOKansq6Beo5Q8ld1+GNwk5NxQCp6rwyUkscMX
	 TNaqOHYIR2qw1LSLpc7phFL6tnMbh98dakB7l+9VcqBzJWQ1rY81PT1RHDxLubSG1bIfS
	 F3thtENj8DjeKP2AZBrdSKKlvCQPZf1bbpZI/F/TpvEyou/csWi/V3P1XPsQ4Yrzch4/1
	 0I+BOArZAzfW/x8OcYKF1pgEo9/5CKb0KQn8J8Q5neN9aIvjxtGPLjWUflkHCWVJbcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/tvdJQVq3FTsard9QoMHcFcQNHCu1SkLFuOiMIsIVX8=;
	b=AiTP7boyjaa5TI4jUMQWNxwgJ1Ft8INFkbUAiW07/+78oKQowMmkZ7Puy2AlBHIGuM/q
	 78ZvU3BjsDUBD4ssWF9Txrk0fBvGgTWI1TS7aSREkJ7fawNCKFgIO6ziyG8xMHGlkDS4I
	 FIxhDeOCnue2PUM9JbDBnyweA85G7YFBCrBLjf2zvQuCKxT3ffP5aCpQoNiYLvXD9Ryle
	 p3iY/00wm1wkCI6FPw8aEIIItKie2kRjbUBg5VECkRE4YfCGSJQ3uQByoLsNcvZhxs6KH
	 tfE2M1lh1sWjp8vFsJd7SfkHWJJYu7LRNWmBdHSiMQfX5nFrFKPFOeIZ5num8rI0PWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tsWVjOsI;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2AE606A88F
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF2AE606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tsWVjOsI
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so1016435e9.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 09:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935406; x=1795540206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/tvdJQVq3FTsard9QoMHcFcQNHCu1SkLFuOiMIsIVX8=;
        b=tsWVjOsInBaAN0oKKg2SkqjDj2B6J+4TCYzq0Jwbdq9zfZT9QmOxouPCNigVgGqXTk
         kIEDioBN8z6Qu3vKmWePVkqU9quAgYdw4Qr6ygr8pOSlxmIHDzJ3cW59DUtgTgEV7JQW
         A1S9/yeerYI5bka62bc3QuWXMCMwqEVSxw41YQkQlSGhx6O5jYIRLlYMCl2n6TGlidzl
         k8+mcJqgzsZVMCVGfVd6Y1v4sEMoOnjhsCf5wMCQnr0gT8soL1aP2xyVF6ONIU7ib9HI
         uT9VN/yRnmp/qpaQRa8k6bcm85IGx5Dg6V+Xu8kcCWHKtS+/0KMbE8lbxbXQUhlBLV9L
         O8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935406; x=1795540206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/tvdJQVq3FTsard9QoMHcFcQNHCu1SkLFuOiMIsIVX8=;
        b=F9g02sMQgkyucvTluVI/ufcJ9dGc3WDHu3M9Fu4OtL8wH0iAMaTp5nM7ShDpEx6cjs
         5VCmSVwG/TqEdSU40yAq6TJOq+a1I4ZjAcW9LFQiRpLNimjDh2/RBxVRVOE0Lm10dDKN
         yTEb5JYD6PeJj4W0HjtPrKqyqrUsyEPTuD+FgwdUKS773tW2KZGbFwamq+krR/ROYnh9
         pIhJtPeuujXedOr5dWn8Ivmle17zkIFL/+RB2yM67uCnpb1qskaZkanfN9EvFafjbgG+
         mqTpy77tM/MREzqXx6RA9RprdNhCN1jYnKHuM8sI3bkX2SPH9Wk6SbTYcXmbjJOUhczU
         /0Dw==
X-Forwarded-Encrypted: i=1; AL+hErHz1dkmiP8Yp00wXB0SMffYoTyGKouIfoqgzLcdsDC+aerW9o4tcotlA2igEaVZ51uH/vjS1Tea2udcR+XQTA==@vger.kernel.org
X-Gm-Message-State: APuU4Z93xXQCgtkTGX1tRTR6sMWp5ue0V2wkuR9kWWGA/STVdW0sceR2
	QnngEAHHEwYAUOX8x9bdJE0s5YOoP/Nj9uIqtHM1ToFjHVE+FWjZN+vP
X-Gm-Gg: AYBFou0FWv7K4SFNqIJgK9sx42ALVArTFp2bE0oHQhEYp5fC9eMytfXeB7+R6n0vtd6
	lNiUjFUBLzvFk6g2w2lgkWX2E9Mu+6RXpKoEQsWe258TfF2caW8ehj17Yl7mn+BYq/+VI0Vwf/c
	T6Mps7vlzXCPGT6f8ooF4uOurFXzW8Zcz2+ZPhYb9vfDG2ic/vhwxE0euQEYClCvGZkK5yqCaRJ
	iotsBar0hnHRjh0iFrEedoEsQYXM62WDgH7Neo7R/iB6KQnfyyEUDhd9SQErL4bWK34xuoVKmvC
	ASuevC1Xjh/fAiMYeiJDgWNLYVSY7dXVhrXXM1mKFINzAYDZHaxzAwj+KG5h/fnj+hVEaxETvVN
	dFxeOEoue2FbqEWA48QZoVPWvayuR+7aCAyPUBGHOqeMI/CXQ5NMzgpoIRoPHv8D9376AjbMZUJ
	qm4DE6qigKiHpTWB7tPqz2yqQ0IkhaqREGI5IyYXQ1mCnFvI6u0EZ1aw0sHwuugptZlAsde3wv+
	OhUSxvJaVi71gm+/h9uTVLoxjKzZiI9+MeTqBRLOe5NB+aayGkR7M7HODqWYpuyQGeTmDxH0CU8
	KM6n68b0DLv8trCHpgELPZdYdzX9UjnHc6yJiHXj4xDW6Wd9HQUUIUWY
X-Received: by 2002:a05:600c:34cf:b0:4bb:6a2d:b440 with SMTP id 5b1f17b1804b1-4bb6a2db5a1mr171276245e9.2.1794935406174;
        Tue, 17 Nov 2026 09:10:06 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26828762f8f.16.2026.11.17.09.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:10:05 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v3 1/5] wifi: rtw88: free the reserved pages of an interface on firmware recovery
Date: Tue, 17 Nov 2026 18:09:59 +0100
Message-ID: <20261117171003.1840491-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117171003.1840491-1-mehmet.fide@gmail.com>
References: <20261117171003.1840491-1-mehmet.fide@gmail.com>
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

The recovery after a firmware crash resets the driver state of every
interface, and mac80211 then adds the interfaces again without removing
them first. rtw_ops_add_interface() starts with an empty reserved page
list, so the pages the interface had before the crash are lost: the
next page build takes them off the build list and nothing frees them.

kmemleak after a firmware crash with an AP interface:

unreferenced object 0xffff0000cbe22c60 (size 96):
  comm "hostapd", pid 25545, jiffies 4296463067
  backtrace (crc cbdc21c4):
    kmemleak_alloc+0xcc/0xe4
    __kmalloc_cache_noprof+0x234/0x3bc
    rtw_add_rsvd_page+0x38/0xa8 [rtw88_core]
    rtw_add_rsvd_page_bcn+0x30/0x58 [rtw88_core]
    rtw_ops_add_interface+0x144/0x2cc [rtw88_core]
    rtw_ops_change_interface+0x6c/0x80 [rtw88_core]
    drv_change_interface+0x100/0x258 [mac80211]

Free the pages where the recovery resets the interface.

With the pages freed, a reserved page download before mac80211 adds the
interfaces again finds no page and warns "Should not have an empty
reserved page". The beacon update work queued by rtw_ops_set_tim() and
a beacon change through rtw_ops_bss_info_changed() can both get there:
the recovery drops the driver mutex in rtw_core_stop(), and mac80211
restarts the hardware only after the recovery. The recovery also clears
the port of every interface, and rtw_ops_add_interface() sets it again,
so download nothing and send no page locations while no port is in use.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v3: no RTW_FLAG_RESTARTING test in the beacon update work. The page
        download and the page location H2C do nothing while no port is in
        use, which also covers a beacon change in the restart window and a
        TIM update during the reconfiguration (Luka Gejak)
    v2: the beacon update work does nothing while RTW_FLAG_RESTARTING is set
        (Luka Gejak): rtw_ops_set_tim() can queue it between the reset and the
        reconfiguration, where it found no page and warned

 drivers/net/wireless/realtek/rtw88/fw.c   | 6 ++++++
 drivers/net/wireless/realtek/rtw88/main.c | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 945fedcd375b..c66dc9086378 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1059,6 +1059,9 @@ void rtw_send_rsvd_page_h2c(struct rtw_dev *rtwdev)
 	u8 h2c_pkt[H2C_PKT_SIZE] = {0};
 	u8 location = 0;
 
+	if (bitmap_empty(rtwdev->hw_port, RTW_PORT_NUM))
+		return;
+
 	SET_H2C_CMD_ID_CLASS(h2c_pkt, H2C_CMD_RSVD_PAGE);
 
 	location = rtw_get_rsvd_page_location(rtwdev, RSVD_PROBE_RESP);
@@ -1765,6 +1768,9 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 	u32 size;
 	int ret;
 
+	if (bitmap_empty(rtwdev->hw_port, RTW_PORT_NUM))
+		return 0;
+
 	buf = rtw_build_rsvd_page(rtwdev, &size);
 	if (!buf) {
 		rtw_err(rtwdev, "failed to build rsvd page pkt\n");
diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b6f..adc54b063382 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -627,6 +627,7 @@ static void rtw_reset_vif_iter(void *data, u8 *mac, struct ieee80211_vif *vif)
 	rtw_bf_disassoc(rtwdev, vif, NULL);
 	rtw_vif_assoc_changed(rtwvif, NULL);
 	rtw_txq_cleanup(rtwdev, vif->txq);
+	rtw_remove_rsvd_page(rtwdev, rtwvif);
 
 	rtw_release_macid(rtwdev, rtwvif->mac_id);
 }
-- 
2.56.0

