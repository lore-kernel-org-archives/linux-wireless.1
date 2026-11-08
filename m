Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143850;
	b=3vuWQqy8gnTOvqjM9F/Qta+BbRKU5lcwFLV/8K7nDTYmMcuMKWBmx+4LmifgCBL1BPg1
	 btT+c7YInvtIC/7EpkdDLupBUtfSszvL1Y9DzV5/qs9h/uRKMObqAA/oP6kXJy0D75ACr
	 CKmxQhs7Eu/T8D3VfCn3p9+OdEPNrddsaM7N4YEuXcQl5Z9aW44YOATnzKwh+F/QCuTYi
	 T348cR5jw2Du7UnksNsikecqDwtI2YeEzjkXHOeI1jBHKmzSyd85uIQQfj9FcKSlMiNdl
	 LMbQ0JvI/VQC2/Ito3JpoDODqfFe558zjBEBzWAWcWiIzyFQIVsc3xXfRXyFT9ntM0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=s9ETy1SkFxHfzD7UXlkSvDH6b6eZN+krDE1TqdkAxJk=;
	b=ezMTi/diLFxkyH1Tp74LVPpzclpmeYABEdz4sSN/F5eJSOswqI/QweRT/IqNp/I1hecj
	 NRgNzLnOfryC2DXciEk0jcShb/gGFMjX4CX1Qrp14KA3jiffTM1io2jkLKxpqWAPH6FKZ
	 DJjtAEPBQpHtxIBXQXfTt8OpfMx9uhsMw85tPMxnNq6mfn7WZPWe6XoOXazT03FX3fWJM
	 TVaI3jZo+Gv991Vvy4OLElLiXee8zScB2/LOeRgNZgIr9KsvtpK4AipHtqXHmX9z1fIdt
	 TdruTzLUIhGs/6XHKNqeEdq2VzlYe3g1H06KNAHBkamclH/KYSUbqP6eyN5TlLdYv1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=acio.nl;
	spf=none smtp.mailfrom=acio.nl;
	dkim=pass header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OgO2odmL;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C17606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 13:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C17606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=acio.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=acio.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OgO2odmL
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c3fd91337baso14356366b.3
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 05:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=acio-nl.20260707.gappssmtp.com; s=20260707; t=1794143847; x=1794748647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s9ETy1SkFxHfzD7UXlkSvDH6b6eZN+krDE1TqdkAxJk=;
        b=OgO2odmLFpsAw0aYRI8dU0hgKP9BKFPtbl49FDX4hf888rzOqGTm0AzwzG0EUDSF3A
         o3gvlFb5WrcaffvrJH9DOhYdd/ZC8ULLVUpzHj5SHP7KD4OQX45aZHBDWGi4Dj0eJcc4
         9AW+pgzzQvHvc3wDz6c7QYXKz8e0DaDK9Y3K6a7thWXy6MiokF1ajzj7nZhv5o0MF5go
         IC1Qrmls17SD3kW/kDG/7gb7puafGqsx8GwxdN+IUgy0WFmNHfBv/IzyVfz+3bc0OtNe
         7kU+xnGdLofM0uFjEVi7uQheE6NjoFwl1fylMqMFcYdNwOIqTHxc6cC3/OsLG1Emz6Gj
         dT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143847; x=1794748647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9ETy1SkFxHfzD7UXlkSvDH6b6eZN+krDE1TqdkAxJk=;
        b=lpAMEbKyCZX1Bfs80RSohY4oezgVlXUpY3yaL2BmkoXxORm+ac0FcRKUDJ5ErLXgbw
         EiYdqWQ2Gn3T5rXI1rORvwCLSPDmj5MY9KK3ihEF9H9X0rPu/u9lMhqfGrL9IcQfpcCj
         aTvQA3oVvfGoUXeiBtoOnhLc53X/uhVAFPJkUv6/xbnphix3XJr1fCimhNtALETCiQ1u
         CS2jMa4l01QNnhMd+SsWr/3Zc5QrzFf57mRST7tgi6ajSTYqVbYpR2z+IGxUywNv0oJf
         7seC+Ax9fTSmkJpPKxE7N6akhONt9nrY5n4xhB0lHCqZSLBAhLQ8LBi1aWiiYJDNbe6S
         ULwA==
X-Gm-Message-State: APuU4Z/y255xQ4yW0pb4+A+4DS3BxmCtxe7Q5CM+hsigPSHK+Cq6TvUF
	9QrMaA4ILNeKvqR2gBwGWvuYTOnbIfwRLoOJ8J7CaCJoitghhz5z+VdBihfQmBzesg==
X-Gm-Gg: AYBFou38MJbbbKCcQUMw213KaZtfV5FtuQxetFPsnB4Hj8Vvzd8onRux2PopWjO8WU3
	lsMaAHmdjV2ij0+VEd/Iv3JmucwS0wXtGY+gtaDT8IpvHocIyPcrbsE+RZEqX9si/npv3FPVozG
	hj3vT6OmAemTTStBjQU8bfgT96Y2Dh0hXLcXFSOkOAspPYpCS4lPt413ADZt5QhTR8dzKw0DqWr
	F41hm1NNCB82a0S8O9499BbsI5VYUL3KTtI0JZy6WJ7h//ODRA4YaB3LLPJKNZh3g5ppVQvIWAF
	7XQ0Zz78tv+5rmc5AilZWnZdllAOU3m8MoNRv6YmDET6nQpPkctDQqGlG0Pv4dKPQxrTfYJypRI
	PvLSTDAoMeSwpONXYcIqknznYHDet2/O9IabnXToRAk+0lhgBYGX3Lna+su6rWZkxBnrJiVFIl9
	zuGHCO/+vU5HMAzZIoknSGgdROP05sw3/rYzykoppXsz0eVC0dzineoUTXYtUYoa1pagmeGZQdr
	cdm35nv8qAQaP5BupTQLWeeCM8srUXp7+fHKS1U4qDTrHsUhbOqk37VoGe0Yrpks/Teisv0xoGU
	2OWFVtb2wiJ/3ozlJEvQfAZ6NxxAZgDdzjVm
X-Received: by 2002:a17:907:940d:b0:c34:c5e8:1dc5 with SMTP id a640c23a62f3a-c4d6d4e45c5mr102730366b.20.1794143846114;
        Sun, 08 Nov 2026 05:17:26 -0800 (PST)
Received: from vschurink-Latitude-5550 ([178.224.169.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9d6867sm58722366b.84.2026.11.08.05.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:17:25 -0800 (PST)
From: acio <spam@acio.nl>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Vincent Schurink <spam@acio.nl>
Subject: [PATCH rtw-next] wifi: rtw89: do RA association again when the station RSSI is known
Date: Sun,  8 Nov 2026 14:17:22 +0100
Message-ID: <20261108131723.206533-1-spam@acio.nl>
X-Mailer: git-send-email 2.53.0
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

From: Vincent Schurink <spam@acio.nl>

When a station associates to an AP, the AP does not know the RSSI of
the station yet. Thus, rtw89_phy_ra_assoc() sends init_rate_lv 0 to the
firmware. With this value, the firmware RA of RTL8922A uses 20 MHz and
VHT-MCS 2 for the station. The firmware RA does not try a higher rate,
also when the PER is 0. On an 80 MHz AP, the TCP throughput to the
station stays at approximately 35 Mbit/s.

Set a flag when the RSSI is not known at the RA association. When the
RSSI is known, the periodic RA update does the RA association again.

Tested on RTL8912AU (RTL8922A, USB) in AP mode with hostapd 2.10 and
VHT 80 MHz. The client is an Intel Meteor Lake CNVi (iwlwifi) at
-45 dBm.
Before: TX rate VHT-MCS 2 at 20 MHz, TCP 35 Mbit/s.
After: TX rate VHT-MCS 7 to 9 at 80 MHz, TCP 186 to 320 Mbit/s.

Signed-off-by: Vincent Schurink <spam@acio.nl>
---
 drivers/net/wireless/realtek/rtw89/core.h |  1 +
 drivers/net/wireless/realtek/rtw89/phy.c  | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 0d893b992a4..ca5f2aced33 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -4711,6 +4711,7 @@ struct rtw89_sta_link {
 	struct rtw89_vif_link *rtwvif_link;
 	struct rtw89_ra_info ra;
 	struct rtw89_ra_report ra_report;
+	bool ra_rssi_unknown;
 	int max_agg_wait;
 	u8 prev_rssi;
 	struct ewma_rssi avg_rssi;
diff --git a/drivers/net/wireless/realtek/rtw89/phy.c b/drivers/net/wireless/realtek/rtw89/phy.c
index 795920b899d..96660b781a5 100644
--- a/drivers/net/wireless/realtek/rtw89/phy.c
+++ b/drivers/net/wireless/realtek/rtw89/phy.c
@@ -717,6 +717,19 @@ void rtw89_phy_rate_pattern_vif(struct rtw89_dev *rtwdev,
 static void rtw89_phy_ra_update_sta_iter(void *data, struct ieee80211_sta *sta)
 {
 	struct rtw89_dev *rtwdev = (struct rtw89_dev *)data;
+	struct rtw89_sta *rtwsta = sta_to_rtwsta(sta);
+	struct rtw89_sta_link *rtwsta_link;
+	unsigned int link_id;
+	u8 rssi;
+
+	rtw89_sta_for_each_link(rtwsta, rtwsta_link, link_id) {
+		if (!rtwsta_link->ra_rssi_unknown)
+			continue;
+
+		rssi = ewma_rssi_read(&rtwsta_link->avg_rssi) >> RSSI_FACTOR;
+		if (rssi > 1)
+			rtw89_phy_ra_assoc(rtwdev, rtwsta_link);
+	}
 
 	rtw89_phy_ra_update_sta(rtwdev, sta, IEEE80211_RC_SUPP_RATES_CHANGED);
 }
@@ -755,6 +768,7 @@ void rtw89_phy_ra_assoc(struct rtw89_dev *rtwdev, struct rtw89_sta_link *rtwsta_
 		ra->init_rate_lv = 3;
 	else
 		ra->init_rate_lv = 0;
+	rtwsta_link->ra_rssi_unknown = rssi <= 1;
 	ra->upd_all = 1;
 	rtw89_debug(rtwdev, RTW89_DBG_RA,
 		    "ra assoc: macid = %d, mode = %d, bw = %d, nss = %d, lv = %d",
-- 
2.53.0

