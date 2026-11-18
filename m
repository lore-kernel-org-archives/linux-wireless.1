Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043984;
	b=Pu7c+tjd5sMRv9+LQrAI1SODQ8nJPaggKV9C2cYOClQCw2LfYnV3d+2iK0eAR4iSUYLO
	 Y2wPzpVl5nDoP5UXfyhcJJfI/aWbUaiAghJNFjTSLcaSDi7D9aFQJfx98BVttjYuodszH
	 CfnPaU4SAOMZSAu0+a/TleqFCoFrhRxH5ZlmiZ9wU9czCIvx6mE4nTjP+g23sJnhJG3Ib
	 FR6YEmPfsDnlVt1hQKFXy6XvP95t8zd78GINOuPUEQXTcHiOyQcmBDHnXju6Ok5u3PNFr
	 +TFsnMaok3MQ7TfLPgLS+4tSWpZns5a3qUBC6XCTNnpIxzvecz09AJtLIvmH1gnZwDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hRgZssAH4ti64ijQavF0eSuzNXMinfBtQMQfYWzf8+4=;
	b=41QYQ6P01yKiRhZTuUA/ItW0QRwu/AZXLheye99GCADttArWiMwCLeEHM7vQ01jEA7/1
	 4/0Z9QqvhSfnI2oMtdF27Hn9swveU8RGC06zo0Mq4hPohBTEyAVCH1rluRRm0UBfa4OK8
	 Fe+KwXl0s6tTkjrnKJCwNYcWX0fD+Gq6kaHr+Lw9xY79dDmTagYYjDkFNW9VwnXTSF4MS
	 0DcncFeL/5Gtz+14cl7TFnoxXENtf7KTwZ6rtlVTC+biof8IP7DIS6RfDY/Uhj3jAf/o2
	 zH0lBN3IQ1xxdfW+BeqnskuHj/FGNvReaD4260rev84P4ZcyZvHOgVDP9xCL2kVN/lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VT2xSSf2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5652B606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5652B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VT2xSSf2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15812935e9.3
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795043983; x=1795648783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRgZssAH4ti64ijQavF0eSuzNXMinfBtQMQfYWzf8+4=;
        b=VT2xSSf2SUQQhwa3jwt/O0jy28UGrwzw1THs30UK1EjDZM4fuSJ6tBh/TxS9UZferG
         iYpUWyOmsnYvB0/AC1O9AdasGL38TuXk/206wPlP6qmNpMrVsXKtfDB6zi/aZ5ZymbpY
         nDclRTHJo/psBN3jpnOVvDjgjcA7q9Ydx1aLRl92On6NFruN0rQUnqwl54lk5cs0rYpQ
         tCioGzppofJwhc+NO9Tcz2VxaV0tZ8P8lNiez+BoCopCr6kj11qJlqXcWHPGlHI67GyM
         x1qeJmxAejzXme7CGjYOh6ai5MGwuii8YxawS/JSnC8n6f3R03ZdF/fON7aKCT3Dm/RS
         MohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043983; x=1795648783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hRgZssAH4ti64ijQavF0eSuzNXMinfBtQMQfYWzf8+4=;
        b=gpA/fT89Nhnb8U9lN2ga81/nHhfu88oqBzsx2VOVh5cfcy5/KRCCRNtWGqREIUuWzM
         BjWrMFtj9egN0+i3QUm8Tg6wMdPmSSraqtrf9zM2PDdPOPPe9OqdXgJwcNjJlwjWUqeG
         BgdrngeJW+S1qt7dW0ABcttEW+22gWYmUQioTP8qQtZlClQyh1X2uJdw1OKvG0A8dQce
         UrcbYyS+H15y/Ug47bj+v085PMEdVAbi6YfP9ukIgXnLKJesQnKSOglt+hFIJGBmB3jZ
         QTYpgY52fEVAhhUv26KS4D6Mba2JI97f5hYTOgDfzagtudFo/UMZWJ2is6ClRb2AUovW
         7hyA==
X-Forwarded-Encrypted: i=1; AL+hErEytUG1nvhZztRtTwnAxPWrfwDAs1HupDaGFjLdK14nzyUVggwWNs5fNCip924vTUDy4dzCTN9Hg6pB2BZUCg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9GadPPY3b2HPYussSSyaCvRHixlyxUcMfslckxnItMf72wZtiZ
	xBTiGo6cUld7n9M3+3KArOnGRTS4wci7fSCM7b4NG5sBLgjbW2An8sbS
X-Gm-Gg: AYBFou28Ght8xM4MdpsQmCH5l8BlggHu4RDmxJ9MmA5cC5ObJ7PLtbiKDi4Bjtc3J4U
	hMJy7mYK0J2PqyKVvRT5Md+zgGXpg8AAbebW6veGUkX752dBz13TUs8JusK/bk/MUC5xfWPU14u
	kejXeamDvcstJKttu8G0pywQViPejvbosabfxr9N8yXwo1hFsoKqxh0ojRVcq9Dy108oBtQ2qeo
	gfWs9Qc11OLn1qvcZkg7n2ifr7c6E7avTKZrUNoVXWyRV3deiNXuW05y+kSPhJkOtCdRxSjXSVj
	CTBi9j7cRefsLXT65gVeRac7rin4+cAzDjbod5jkytOPztcdlw+Q9MEVEQemrpXt6qDh5AiEqfT
	4JfF15O+Jc+Joj+8MKpXFHxoUGrkQ/k5RXP9dHjsIyG/a7aY+o01KQkOJP6QSs2ya9Zs91G+ojM
	eBxBRh+YxVX45AoV/Qs97oG2x6rX3sjosNyVLXYWifc5R/vjUL1Jh+u4GkaWwae3V/Pq/S+zld7
	Z26ISujFRMNFEyq5GyhQ01eTNz8B8LK7eBd+PKO1QBEn68FR3zVhz+iqvATa1i9yGIhv+ssNgcT
	FoFuUwQzDZz13cR0us4Vzp4sT+vLM5Fq3mQ=
X-Received: by 2002:a05:600c:4e87:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb7da2db77mr85733475e9.22.1795043982770;
        Wed, 18 Nov 2026 15:19:42 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb842f9348sm5966095e9.8.2026.11.18.15.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:19:42 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v13 1/3] wifi: rtw88: download the beacon the reserved page was built with
Date: Thu, 19 Nov 2026 00:19:38 +0100
Message-ID: <20261118231940.3950-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118231940.3950-1-mehmet.fide@gmail.com>
References: <20261118231940.3950-1-mehmet.fide@gmail.com>
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

rtw_fw_download_rsvd_page() downloads the beacon twice: once as part of
the reserved page and once more on its own, so that the firmware ends up
with a TX descriptor that describes the beacon rather than the whole
page. The second download fetched a new beacon from mac80211 instead of
downloading the one the page already holds.

Besides the extra work, every beacon fetch advances the DTIM count and,
while a channel switch is announced, the CSA countdown; doing it twice
per update steps a countdown that starts at 2 past 1, which mac80211
reports as "beacon TX faster than countdown". Hand the beacon skb out of
the page build and download that. The hw scan, which downloads the
beacon without a page build, keeps fetching its own.

Without a channel switch nothing on the air depends on it: the hardware
writes the DTIM count of an AP beacon itself (BIT_TCR_UPDATE_TIMIE), so
this is not marked as a fix.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---

Notes:
    Changes in v13:
    - none, rebased on rtw-next
    
    Changes in v12:
    - the commit message says why this is not marked as a fix and what
      mac80211 reports for the double fetch (Sashiko); no code change, the
      tags are kept
    - rebased on patches 1-4 of the rtw88 firmware recovery fixes v3
    
    Changes in v11:
    - none, rebased on rtw-next
    
    Changes in v10:
    - none, rebased on rtw-next
    
    Changes in v9:
    - none
    
    Changes in v8:
    - none
    
    Changes in v7:
    - none, rebased on rtw-next
    
    Changes in v6:
    - none
    
    Changes in v5:
    - none
    
    Changes in v4:
    - none, rebased on rtw-next
    
    Changes in v3:
    - the beacon out-pointer is initialised in the caller

 drivers/net/wireless/realtek/rtw88/fw.c | 34 +++++++++++++++----------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index aa2daf2d1820..e0f3e1adb13f 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1625,7 +1625,8 @@ static int  __rtw_build_rsvd_page_from_vifs(struct rtw_dev *rtwdev)
 	return 0;
 }
 
-static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
+static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size,
+			       struct sk_buff **beacon)
 {
 	const struct rtw_chip_info *chip = rtwdev->chip;
 	struct ieee80211_hw *hw = rtwdev->hw;
@@ -1705,13 +1706,15 @@ static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
 	list_for_each_entry(rsvd_pkt, &rtwdev->rsvd_page_list, build_list) {
 		rtw_rsvd_page_list_to_buf(rtwdev, page_size, page_margin,
 					  page, buf, rsvd_pkt);
-		if (page == 0)
+		if (page == 0) {
 			page += rtw_len_to_page(rsvd_pkt->skb->len +
 						tx_desc_sz, page_size);
-		else
+			/* the caller downloads it once more on its own */
+			*beacon = rsvd_pkt->skb;
+		} else {
 			page += rtw_len_to_page(rsvd_pkt->skb->len, page_size);
-
-		kfree_skb(rsvd_pkt->skb);
+			kfree_skb(rsvd_pkt->skb);
+		}
 		rsvd_pkt->skb = NULL;
 	}
 
@@ -1726,11 +1729,12 @@ static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
 	return NULL;
 }
 
-static int rtw_download_beacon(struct rtw_dev *rtwdev)
+/* the beacon the page was built with, or a fresh one for the hw scan */
+static int rtw_download_beacon(struct rtw_dev *rtwdev, struct sk_buff *beacon)
 {
 	struct ieee80211_hw *hw = rtwdev->hw;
 	struct rtw_rsvd_page *rsvd_pkt;
-	struct sk_buff *skb;
+	struct sk_buff *skb = beacon;
 	int ret = 0;
 
 	rsvd_pkt = list_first_entry_or_null(&rtwdev->rsvd_page_list,
@@ -1747,7 +1751,8 @@ static int rtw_download_beacon(struct rtw_dev *rtwdev)
 		return -EINVAL;
 	}
 
-	skb = rtw_get_rsvd_page_skb(hw, rsvd_pkt);
+	if (!skb)
+		skb = rtw_get_rsvd_page_skb(hw, rsvd_pkt);
 	if (!skb) {
 		rtw_err(rtwdev, "failed to get beacon skb\n");
 		return -ENOMEM;
@@ -1757,21 +1762,23 @@ static int rtw_download_beacon(struct rtw_dev *rtwdev)
 	if (ret)
 		rtw_err(rtwdev, "failed to download drv rsvd page\n");
 
-	dev_kfree_skb(skb);
+	if (!beacon)
+		dev_kfree_skb(skb);
 
 	return ret;
 }
 
 int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 {
-	u8 *buf;
+	struct sk_buff *beacon = NULL;
 	u32 size;
+	u8 *buf;
 	int ret;
 
 	if (bitmap_empty(rtwdev->hw_port, RTW_PORT_NUM))
 		return 0;
 
-	buf = rtw_build_rsvd_page(rtwdev, &size);
+	buf = rtw_build_rsvd_page(rtwdev, &size, &beacon);
 	if (!buf) {
 		rtw_err(rtwdev, "failed to build rsvd page pkt\n");
 		return -ENOMEM;
@@ -1788,13 +1795,14 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 	 * the beacon again to replace the TX desc header, and we will get
 	 * a correct tx_desc for the beacon in the rsvd page.
 	 */
-	ret = rtw_download_beacon(rtwdev);
+	ret = rtw_download_beacon(rtwdev, beacon);
 	if (ret) {
 		rtw_err(rtwdev, "failed to download beacon\n");
 		goto free;
 	}
 
 free:
+	dev_kfree_skb(beacon);
 	kfree(buf);
 
 	return ret;
@@ -2352,7 +2360,7 @@ int rtw_hw_scan_offload(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
 	rtw_fw_set_scan_offload(rtwdev, &cs_option, rtwvif, &chan_list);
 out:
 	if (rtwdev->ap_active) {
-		ret = rtw_download_beacon(rtwdev);
+		ret = rtw_download_beacon(rtwdev, NULL);
 		if (ret)
 			rtw_err(rtwdev, "HW scan download beacon failed\n");
 	}
-- 
2.56.0

