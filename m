Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399333;
	b=GSMt2cnGFkywX13/Px6IcxFONJ7i4rcLAKehy1Qd2tCOmVJUhw+CEyo1Ui/K12LM1CdB
	 Hnu0pb0NIBRusQSJE7v4bBXlRdJvmZ4YDMGnfj25/h67cYbniCg6z1UJHAwxZWhSj41KN
	 GFuB+TmOx/LML9URFaegCIHOeiN4bJXKv+TFKUVnrd+7iHT9Vyh3nm1ZG2vvpkupnqcA+
	 837N/5Bwiw92qBoFCF0sGY42xB+RGikj8Oqzh1SNcGyShHk15OxHCVeL509IEzPhNpQz+
	 B5N7Q45pl7g8sywyA7vOIwtsU0v35Fi1aEpEiSGGl6kN79cdXywJvYwKRCCd1SyM0Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=46uYL2ClWBoj7bRXpzfW+g+ax99PKPxireASLojWmtw=;
	b=xY1XmQZr0McNMOrkOsQkW/6zI7ECSmOCUwKjwUbtGu37OqKoHvsZrL/0TQRQqitfVb1a
	 BJ4WvtmgpIEyJZdmk7eOrZfdwOhLN9+DTtzlLD3kRWjZtkgmmAw02bKGvSuEhJmuA41hs
	 1EN35WTR3v7a0xhL74TSNQ/UfmXW12xGgp46+bl/6N/VrnZcu8kF+TzU3Kn7FFeeKnRAJ
	 mLGAbmVkkNeT8VK5rttWeZOy1qxCKUAWy3im4/Rd+c2dVRxc0B76xA0F5MiV4k5H6Dgc1
	 KzrD552EgFZDXrDS66mozaxYifAJE2yFiN+BUk6IdH9qqp0p08WeOLddJFpxmW4sOLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ze4Oa8Zv;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2227606A332
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 12:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2227606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ze4Oa8Zv
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91befbcad6dso35588796d6.3
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 04:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399331; x=1795004131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46uYL2ClWBoj7bRXpzfW+g+ax99PKPxireASLojWmtw=;
        b=Ze4Oa8ZvawDYlRmmmpW0iE6IRcVrPTnd6fPfVEv75rA8APFNrMKk1MKRBcogVo4Pdj
         JfdJ8Pz961WQI6wjofWc/pFgEHz5shqG6XQx+fosB+dnadROHKCkQ1OxtZ8IjHWnrPh7
         HpGg+/k9jjKF0w2GwmTkkFa7ejr5fR8+EEwfs8Z4Zqvgx0auRZBQnQst6n5dYvTvTfyr
         xa2GC2xd6KvhcuZJR60BihexNjRezarHMuQ+KVwobPvnEs+RxIhvZWGy9FFPh06kIWd1
         xFs+QP22u9rJUcy2A2g+QbLEkrzitOTjAtF94++Ulrfmz/Z8aJxyoDVbl0mYhrfGTwng
         MBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399331; x=1795004131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=46uYL2ClWBoj7bRXpzfW+g+ax99PKPxireASLojWmtw=;
        b=j1QEuZRHmgiJxk2Pwep2imjhmSxD3BXWq5CBiq2gBIzhZOm8gtG2EcUSyG/MAc+7yU
         CSsTlVx7XumJ9DI5wF/AD/VCfwUEHAs0m9ewJTcrKA5DSI2bLn0i2YEwAciOZRMc3erd
         FsRHiEDWNmv97zL82Rh2UHSHM6jGuOZg7kYi2ele0o8Twh+12zdNvzJsI4V/vXR6VU+9
         aB625TkFOjs/Lldfv6uC9i6NuNrzp47QRiE5sMzdxqeLh9czXbzNeRsyiXRUcrjZr3hL
         VjmVEcPE2pBso4eI+v2W/QAVGYZkJFxVvW1ADyrwJJrnlF4HZAE3i3xGeKswg1a2lrR4
         XmAA==
X-Forwarded-Encrypted: i=1; AL+hErGnGNKAQKzvmXgP65AOJkcr2/WRLBdZPG+7lCC92TjxlKI5CKfO2zU6K8sOPVwBPBtLc5e1rLfiEFX103+kfA==@vger.kernel.org
X-Gm-Message-State: APuU4Z917FBM4nFYPKFE+JmPwO5G1H0yiM4GL3zPFG/W7r0JVVEOMYMg
	b9YmdK5i+gN5qiSPqzWrEdlznnpDEw/LQgf6W9ynax9SjWnNuwPX1Z55yl8Etw==
X-Gm-Gg: AYBFou09AHFYhOkz9eqeU8Pp1PQWCpM2Ew/wYgtmtL084CaZwpa2M0jG7lT+PPXo7t+
	ZQw/dpurkhdGjfvKieq4UhEBUWa2cklu93YlmImKYaeXAAKtUQGwpKsQTKRMIFXT4rFXukT9JQL
	vDXvTEtJ48HZat3FDLL+/QH2ZxNvimUGPIbkDn5Sd7+Li4MfqdAxF8eTUuk9chhWD7OrqCGIOQA
	noZ45tLLQMj6XWzhWrK9jVDM2t4dQE9HBBf9UhMEF/UiRYCKL8v9vFz4aIlre/A5R3wsOwugToU
	QGu3zGpc4tkIUom9p2P7lIc1DUTSNg0e45syI8lnQRZS/gV4FmHGguMJXlv7cdCYrV229eAxY5W
	RX9pOguRU6y3Scp5nif4V4c1MtOr6+CACUDtMYwPanyWLeZALSp7HDt3mdAVGZmBs1tRIeS5I1z
	jLH2JFNEv8AhU+JgdCFwHO3o2JFIXaAA6+V7UfuL6pg5DFTI92LkAbzgOxF2gz1Hx9n8OciSPAI
	5p17ZOi4mwX3KptisS8zhXK6996APAGmdejvW8pIViTHThGabOJIr75woW1NNPlfd/HxAMygFWz
	+3xdWtQaYgqU2JRoCKc2VZmbLKyN0+o4f+c=
X-Received: by 2002:a05:6214:2346:b0:91c:6a41:7982 with SMTP id 6a1803df08f44-91f03dae7a8mr38540816d6.8.1794399331383;
        Wed, 11 Nov 2026 04:15:31 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f02ca1ed7sm22042626d6.24.2026.11.11.04.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:15:31 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v10 1/3] wifi: rtw88: download the beacon the reserved page was built with
Date: Wed, 11 Nov 2026 13:15:23 +0100
Message-ID: <20261111121525.358041-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111121525.358041-1-mehmet.fide@gmail.com>
References: <20261111121525.358041-1-mehmet.fide@gmail.com>
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
per update lets a countdown that starts at 2 reach 0, which mac80211
warns about. Hand the beacon skb out of the page build and download
that. The hw scan, which downloads the beacon without a page build,
keeps fetching its own.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---

Notes:
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
index 945fedcd375b..3cd17a3bb494 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1622,7 +1622,8 @@ static int  __rtw_build_rsvd_page_from_vifs(struct rtw_dev *rtwdev)
 	return 0;
 }
 
-static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
+static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size,
+			       struct sk_buff **beacon)
 {
 	const struct rtw_chip_info *chip = rtwdev->chip;
 	struct ieee80211_hw *hw = rtwdev->hw;
@@ -1702,13 +1703,15 @@ static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
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
 
@@ -1723,11 +1726,12 @@ static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
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
@@ -1744,7 +1748,8 @@ static int rtw_download_beacon(struct rtw_dev *rtwdev)
 		return -EINVAL;
 	}
 
-	skb = rtw_get_rsvd_page_skb(hw, rsvd_pkt);
+	if (!skb)
+		skb = rtw_get_rsvd_page_skb(hw, rsvd_pkt);
 	if (!skb) {
 		rtw_err(rtwdev, "failed to get beacon skb\n");
 		return -ENOMEM;
@@ -1754,18 +1759,20 @@ static int rtw_download_beacon(struct rtw_dev *rtwdev)
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
 
-	buf = rtw_build_rsvd_page(rtwdev, &size);
+	buf = rtw_build_rsvd_page(rtwdev, &size, &beacon);
 	if (!buf) {
 		rtw_err(rtwdev, "failed to build rsvd page pkt\n");
 		return -ENOMEM;
@@ -1782,13 +1789,14 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
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
@@ -2345,7 +2353,7 @@ int rtw_hw_scan_offload(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
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

