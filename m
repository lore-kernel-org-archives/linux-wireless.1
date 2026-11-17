Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957989;
	b=goFSeMwNz+X9YHXJ6MUgx6CuEbXDBwrhrWcmiW9Z23GQWH9eeAoRjkoUjALGyXsqDFP5
	 LAzkToXUSxYJSVTZvIGGPSDrvE369t68dSHroq2lpGzmS+tu5LtP6KLGJYyNu+AbUKpbH
	 Du0m4jWk0ZZR7YL8NVIQJ/pL2t+TaqQNGrpljdtcZg5xlNuBxmRWfhsmWcaZdxhRNpN4B
	 3X4NMDKg+9e/rjjc5uPpE/i50AxfO60+UZJLazQLZytlj4carj4f0TYN5jDKTjpwBlZJn
	 LEY/DZ0luhoszX1LEUqvusJElZUsivM2Hdw9RUW3gYFlh2X3Y++pdZhnFc5vfhg1Z2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qf/XXvlSe6pIoovN1W4PqCb9IYAyTrZrsA1isV+LsdE=;
	b=jH9K2vokOFDgyVMquqMc6W8ZM9MtlQHyi5tQhko1G/880cvr2hZtYz74R6ez70VnVdHN
	 TUAi+FGtdN3l4GDMqtiibBgK3qWKdB+WjmB9sduS5oGnE52dNZaqctyNbosmqZRyKiuDp
	 vRrlkXCR6aAJXDw3Rv5WX1g8H+gtkUL8AvMS4WYlQjpQFtxupFIjvtlQc0TI+vYXA8Z5I
	 vji98mJx2aynPy/d9V3jLYEVmrpeejkzO70ne5aXCT+trIhwsIhKllGd4PhdYqlRDUZBm
	 gZrZ+wMOZ1Wt6Wouijsf8AP9uvLkhHX3nHbpThUiNFgssNzh548dAHDien34ykfdqLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tT/h3uA5";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F3D606A32F
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 23:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F3D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tT/h3uA5
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb61185057so3334425e9.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 15:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794957987; x=1795562787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qf/XXvlSe6pIoovN1W4PqCb9IYAyTrZrsA1isV+LsdE=;
        b=tT/h3uA5Iy4e2QyqTe+NwuaRzLu3VNoD2C+LhX4SeIqlM7NxVhC3qfcwXoiDntFQMb
         gHGa9nM3XAjMmBjjGl/G/b8UwJSjbWIbLMMD8CnFdI8vDVyV8LuZHhCBaycDBChy9dWX
         NHQT33FwQTppWGOihzJ12mNFXZApVe6/6wb3/4gDxNguu8v9LLMoCwtBVEoXzdpONDiG
         irC5KjvpFVJ8dx5ZNY+cdSJNX9FjdXrz3OElOq0bGv0W6wG9y03neFpWqUgIRElGDwx6
         nx9il3GkbGYLmyWblVL7JjsIomdenqk8qQEoZ9N6aipr0D9Go3JTL12GiHqxGzz02BPU
         g3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794957987; x=1795562787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qf/XXvlSe6pIoovN1W4PqCb9IYAyTrZrsA1isV+LsdE=;
        b=oumkUpMm1E45mJ+4p7ADK52OX8LAnymO8wwqjFXsnnAm/8ssyqBXGBLgXUFS4eX8gL
         5Wy1so4f8rKE9P7H6yYqLG5pFeLzJHpYt+yGEub7IJR22naGE+DUU+h5UaDNiK82EQEa
         z6lgR1XgOtKHeInfmsF2mVSOgaPnGo+Bd1E9wCE3dgLaZ1pH96AqMstPhv1euRF1X6ND
         14sTiNwp4HOa6Q4Ey5saSN3g6xHJ0tAIeY/wHBhIzGzNRPwRt1RJCp3MX/iuDfI84Fd2
         C9bHVcI0Xdl90rseug3phkAv88YB4UkMqDwVHk3pkN3eT5lGOytowwWmovVN1Ey259Z/
         u6IQ==
X-Forwarded-Encrypted: i=1; AL+hErG0XBQeb6XHSGCt0rG3H7HyoCHVR5cbZtS4gbCnB2Fjrff8+DRU6ual+pzZC332rp2TVk0ILE5zKVsxquvrXA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8u2XFIlYskHkg70wCGk9TP9FpGF2rNq5p96k4mvghZndQtncnD
	fC0jemS9mddRvzyRvlVk2+uGmc2T0SlOhpo4C+Bbl1/Vx8XxMuMeejtQ
X-Gm-Gg: AYBFou1k0r39R6PYPSCNc6lrLTP6kKEisCgXeAtAwkk6tvvud4cEEL6depSYPWNvcGK
	Zw1cgZ3+3gRZ6/DTvMc7KAtcQz7/SpRDnrG7e7+pMowICiMNeCfKJHSangY/9XjLYwBfkPFGhha
	XM2rgRVlxxLtzEkPkJ7m9llWeT6QAMaGffXgUOzfd0dj2dSO/nUjjo5Y734zWgaINVAano4HdJB
	bJmGlY/w583ZinwjEbFpfJBOCGNzZlsN3bhzPBJ2Akga+cKgvqTSfbObhj7ZpfCavr66SGlzS9k
	DyGxCw8jjQdAQY42juEqG4G8QLVGWEn2c8GSXZsJhrkDRiV5zTJ3ANqAP6rW7QC9Vhm7OFv7CP8
	NM8skalwUpK86tBl1OcVYryZFO7Dr+NL9YqJaLUJqE27viYCkkKU8UAQsOq34qX5Pk9PC39XEnj
	JmMwGIUHQvq40nSIrTC7OOJrCKhaYR5IkyQlGcbaRa6UymMmTrppI6+co/0RpkFvse4jL69iRFb
	fmZ2oGqTMIf7pgu6HDV6AjMuav/iszfFzYY+ABDVCnqgpl4wwjMICxvMuSJVy/1R0mqpTIabFu+
	mi37FVLp7Cg8nIgmlRbjz1yXh0Us8YlPdrk=
X-Received: by 2002:a05:600c:6092:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb7da229bbmr13417935e9.8.1794957987047;
        Tue, 17 Nov 2026 15:26:27 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b979bsm20013915e9.11.2026.11.17.15.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:26:26 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v12 1/3] wifi: rtw88: download the beacon the reserved page was built with
Date: Wed, 18 Nov 2026 00:26:22 +0100
Message-ID: <20261117232624.1956815-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117232624.1956815-1-mehmet.fide@gmail.com>
References: <20261117232624.1956815-1-mehmet.fide@gmail.com>
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

