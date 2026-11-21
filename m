Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289810;
	b=zCUqp0yPpdHqLZzzgG8tu5Nb0nv92PKXGROVxEwNNoeW0qL2U4QPD+/nnGclFPD+igcM
	 d+ht5aPgjj3hJLTRgS+bh6W8F52EBb8hR/DtPrgY/sdyC0cQMAt6tTb6QHsmBVfe6VJ8N
	 oOYEo/dI+hKyLNQDz7iuFzOMBjnzH3NYLDfgM1io5x0e4pgOL07w7jeGC0M21TitTGVcI
	 emCzFACtuKaMNNa5qChJqEf5T8p4awL1bBa/aF/FATh6KQ8ZOMSwBQOm7rTWXFqmC2sj/
	 A4FlnhtD4sgyfUb0etyzbVK0FWedBmyuJ9YgxQMgrzCiBadwqjKd8zApx+6ifbck++g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fO2eIe95VRSOU1KijFAbx5NDCPAQZnU3pyzGbtCTNiU=;
	b=guX1s5WGsh5SRu8Nk8LKIqUpMZjVyHvtJGp9OtjFWbHXb8q33356psIm2CfJ685HfCfJ
	 MEJ7lz8zAS+ltmNL3nP+rjg9wp1nXNkGE9oTzuniYCqMwCKAe6KgGTWljCPWnHI5rLKJf
	 TmR5dAJZkLxPiZzlBHCYPUlLSMztG+dnsM0XOtem982o2BPRaB4HEBGeR90MaK8FP9jD5
	 amlwWydJ64Rmg/lXRA7Lj7Av4qIv0vUZc7FmugYuCopfJROICdtKk52P+8K25k1YCoNf7
	 mWt4IDNVzqDEZiunFsT6QyakY4UpWkSIw/JfB5AqFPpdXsJCK2/azXNP/OGNPKvKgwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SwixXAk+;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292CB606A33B
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292CB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SwixXAk+
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f2f2edb19so183468885a.0
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795289809; x=1795894609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fO2eIe95VRSOU1KijFAbx5NDCPAQZnU3pyzGbtCTNiU=;
        b=SwixXAk+ZetlhyVtXtXfp0VCRquNQkJstma/w/otvw5nOHlLH1DV0NHlPjAzxNfTkZ
         fSPOtLHgNCVCutXTRd8sIbHKuZDvBvLb8MasuOnAeuEStL8ZTNs6TqqAMCEKsP08GltW
         98NS6Ulnj2Ev+CUuc9U5ab2bSV54WZH7EdTsE0DtlBGeSw/P+EUOpFxUqE1zG+vW0oPI
         /rHNk9jlGdWqvgLvzYN+9U3+cs4zI5xGCdpPH6vm3tIc/uFTM9QqfyXAAKkRGr7zrnC9
         kDo4fohc9UUcZNB900rnlgHWbiIensp6W4+IqpEf0F2kLCDW92s8LP0bxmVWT+juCZux
         nF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795289809; x=1795894609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fO2eIe95VRSOU1KijFAbx5NDCPAQZnU3pyzGbtCTNiU=;
        b=WTNPq6IiYzxyw1wQjWt+dXoSgi8JECNUZV/d8eMnqlojusKsyMwVvxw91CNW56wXf3
         ou+AdiGNXG69to9dLT/OoWbpAoD+lkbYkv0fwXOcm1iOmmKf/0gCl9uQ7QveoQ8flO5E
         Iqmi+PtW31FB7DoG4VeNaqEI6pEfBCq0FKOFtpkg9a26WbLDi97nDjBpFDuztacDtm9N
         iu0B6MXSBL51LUwOHNH+lPX55Z7dWIBzd2bPPqrNgjiluomfjtukP5Fl1sDr4WBjnl/Z
         rpQ3vEw+Um8epqpoGb0aa0deLtxXivHgIeJauqnRRA++nOfaXhvsgUQFnSnVGspeYS++
         ut+A==
X-Forwarded-Encrypted: i=1; AL+hErGHI6epwnIxQaluxiSixNKHJBezAG5YxIa8c375OMXctGvXSmK3//GfTEndodTvHVace8KjdWkY8o7vEOQ7lw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+2HSr3tEGxDSFHLdck71NI0T/FFkI2fKvv6vf8yPIYU7ReRwzv
	HJzRYlLuHP/pUknG56J2R2UyIot3H4Tr4jxDQkmnzezESXlT3+oXQ5+Y
X-Gm-Gg: AZFdTZeolUqVuqzOAlCVyX0/m8Ldp/9Lk4PxpptweRH2jOODBbl0ozHPXMChaHx/FmG
	rxSapaiYThgvSk7sdG4NMTAMsSSFSN6toHh1TxYHM3jGaPoA1QEi3WUr9lHLBYEsXccyobk/PpF
	IpEckN2IdXVLvmWY/AXPmnncjh/qL//BpfCHKrf947njCHrOv8jRFlzjj73+ASQrHXXePUowGqm
	+X4wHwF/nt8v6f2dsMhtpvc23tg7stCiewK+PTty6oFQQS8Ewr1EbO/A4iFJlillfw/oBfIcM96
	7vbLUeUhty3HEjWqoeZNH6xDiNaIoI6KnMMrmF991rBue1HWY6DdAUEvv+fFW8ub3Ff4ZG9japw
	WkVn9H8XZYYzVSuejcK1wKKrQhKMurX33KAiQ5PpTgZ/eRO+vnb1GsfrRdaFCa0fttBTnq5/9p0
	kuLlQHCBTnJlRUWeTnISeg+ybUJuYv64gTfuijszAPU3zhFsQYseebE1+i60LBR8kZdMQMtJPJ/
	NiNVdpeffkfLbUCTfa3Nr74q3dgFSITT5hRwCt0J4Zmj5Ed5NjeZvHcybTc9ziUMOnnAwpyb+Cl
	m8WpMp96IMbR58hXrtvu/enxLgtUiNCnqWA=
X-Received: by 2002:a05:620a:199b:b0:949:7502:69c with SMTP id af79cd13be357-949bab7ee59mr1204791585a.73.1795289808980;
        Sat, 21 Nov 2026 11:36:48 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb427388sm466931785a.42.2026.11.21.11.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:36:48 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v14 1/3] wifi: rtw88: download the beacon the reserved page was built with
Date: Sat, 21 Nov 2026 20:36:42 +0100
Message-ID: <20261121193644.603289-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121193644.603289-1-mehmet.fide@gmail.com>
References: <20261121193644.603289-1-mehmet.fide@gmail.com>
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

rtw_fw_download_rsvd_page() downloads the beacon twice: as part of the
reserved page, and again on its own so that the firmware gets a TX
descriptor for the beacon instead of the whole page. The second
download fetches a new beacon from mac80211 instead of the one in the
page.

Each fetch advances the DTIM count and, during a channel switch, the
CSA countdown. Two fetches per update step a countdown of 2 past 1,
and mac80211 warns "beacon TX faster than countdown". Keep the beacon
from the page build and download that one. The hw scan, which downloads
the beacon without a page build, still fetches its own.

The hardware writes the DTIM count of an AP beacon itself
(BIT_TCR_UPDATE_TIMIE), so nothing on the air changes without a channel
switch, and this is not marked as a fix.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---

Notes:
    Changes in v14:
    - dropped two comments that repeated the commit message, reworded
      the commit message; rebased on the rtw88 firmware recovery fixes v4
    
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

 drivers/net/wireless/realtek/rtw88/fw.c | 32 +++++++++++++++----------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 09b5836540c4..4575073d0149 100644
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
@@ -1702,13 +1703,14 @@ static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
 	list_for_each_entry(rsvd_pkt, &rtwdev->rsvd_page_list, build_list) {
 		rtw_rsvd_page_list_to_buf(rtwdev, page_size, page_margin,
 					  page, buf, rsvd_pkt);
-		if (page == 0)
+		if (page == 0) {
 			page += rtw_len_to_page(rsvd_pkt->skb->len +
 						tx_desc_sz, page_size);
-		else
+			*beacon = rsvd_pkt->skb;
+		} else {
 			page += rtw_len_to_page(rsvd_pkt->skb->len, page_size);
-
-		kfree_skb(rsvd_pkt->skb);
+			kfree_skb(rsvd_pkt->skb);
+		}
 		rsvd_pkt->skb = NULL;
 	}
 
@@ -1723,11 +1725,11 @@ static u8 *rtw_build_rsvd_page(struct rtw_dev *rtwdev, u32 *size)
 	return NULL;
 }
 
-static int rtw_download_beacon(struct rtw_dev *rtwdev)
+static int rtw_download_beacon(struct rtw_dev *rtwdev, struct sk_buff *beacon)
 {
 	struct ieee80211_hw *hw = rtwdev->hw;
 	struct rtw_rsvd_page *rsvd_pkt;
-	struct sk_buff *skb;
+	struct sk_buff *skb = beacon;
 	int ret = 0;
 
 	rsvd_pkt = list_first_entry_or_null(&rtwdev->rsvd_page_list,
@@ -1744,7 +1746,8 @@ static int rtw_download_beacon(struct rtw_dev *rtwdev)
 		return -EINVAL;
 	}
 
-	skb = rtw_get_rsvd_page_skb(hw, rsvd_pkt);
+	if (!skb)
+		skb = rtw_get_rsvd_page_skb(hw, rsvd_pkt);
 	if (!skb) {
 		rtw_err(rtwdev, "failed to get beacon skb\n");
 		return -ENOMEM;
@@ -1754,18 +1757,20 @@ static int rtw_download_beacon(struct rtw_dev *rtwdev)
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
@@ -1782,13 +1787,14 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
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
@@ -2346,7 +2352,7 @@ int rtw_hw_scan_offload(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
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

