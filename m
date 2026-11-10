Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285226;
	b=cr8nE9+otc2QkYnHynVjHxfcc36O5BEpbtnp0mPhvOht2jr7uAbVAn1syw+0p6/7kV1x
	 BSuh3SeZIjWl3UXQToXkx/42s/XqIKreK5v14u7FjdoTTSulgRmOKHPvEpCAX4XdYEe7u
	 XCdlAISFQfNSQkok0ZZsxVMaG05FHBsKUCsTl3c+UZP21g4TS1nw4xX6+h/DvK7nnSu2o
	 lrnQVs3YY6Iknz353EdPjnKUNwN6zsSrCsBI+CkvzMrzGHL9tzxToo5EL/XDtPfREsmx5
	 2Mj8fGM7LNrOBoZLgLtePVKLbtn51ILihS4ba+nI6oJwQm0F+VAWcpoeHYvc8Ue4vTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vIUGqldDHjaxLRO11qCky36mA4s9BAg1NT3SJMAWiTw=;
	b=AC4amTCOPmtzENbfO3JPHWezKgDUKyVbrQOJvfpxzBoYiGjFeD8Frw4mFdV+cr5wJfUH
	 W+S7yUUN/CmjaVKpnuDvCP+rmJPJepceQDHgyKxi9M/26EoMwFtRA2SS/LjObYzaxD/C2
	 wbte0wbBRguyzTYwtINnGk4vgkdCQUpqk+ztsampk4o1fYcJX/F0miBmiIE6f9gMFLknG
	 iCUExPmyWVe5T+kSjRiU+frIY8flVqkLgObN/BK/7p+y7uKsd8ON3kx4mh/jRcsz9x/He
	 FOP6+kVBlsOT7WTtWiifxYqVFmZ75P9c2M3AGNOgsaVU+0T7MI9kSXx8rlUGxe8NdAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RpiaLbEY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IG+O4QWW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBE360A2609
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBE360A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RpiaLbEY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IG+O4QWW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A2um2249765
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vIUGqldDHja
	xLRO11qCky36mA4s9BAg1NT3SJMAWiTw=; b=RpiaLbEYvzPPCyN3iX62EgwR++m
	3RVVoGFCijbfex8NUkm5vc9U6th2ZomhzKTnv0hqMU3qG+wfrtYyYTSwSt1iHWgw
	E1GC8v47Zho23aIgGI3d7aQqHsPF77FeoTPNOhzBuMomLhCIIra7TbWzxqyTBL8i
	0mykKrb7+swcJMGtZKMd3LjuJSIyMJ6Q3LPirRw4iYmfVnm9YP5sE+VAQ6I5hNSe
	dyYzKCmux2ZUtS5iJDdMN1IWOOKTKnm1aSFFYVgq0N7bGoh+aCBzR1/MoLFNwWO9
	jTG5Ko+aX6O9AS1tgmeceQ8eUNwZswgFqYjYxksdivhKhh+Ofw5PJi7/q/Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapbms2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so563555eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285224; x=1794890024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIUGqldDHjaxLRO11qCky36mA4s9BAg1NT3SJMAWiTw=;
        b=IG+O4QWWMzkeHVzS18qMDQwxSTqY9hn1vAc+/s4TsosvYAq27XXuQYl8kB2B7KGJM4
         qiQmsWEu/rsVQjkXNvlRp8fBvQ4JDiMg8m0bLqeC6txprSN6yKabnJieZ4XTyd4/5DwC
         YOqcbor4qS3gW4vuowctOqMQC4To8KdHRBkFi+hysrHYZkhKI8bJElOu6ln9wlFu2ozo
         TbD8Z4gkTon7SpP1BUjuWmVmpNAqJeyIyC8RfNtEMTitttPlmER1HjwLki/auydiAwB5
         K4QeujsGzN1BQlhymLR3EBRGuKmC0d9ZAoB9agHHJ1/6GBwhup90GkMYPZyAXbuPEEbu
         MXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285224; x=1794890024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIUGqldDHjaxLRO11qCky36mA4s9BAg1NT3SJMAWiTw=;
        b=wND+osDcJlKUERy76nNxsgWwe2QJDwWs6aMqUmDyvSMD7+SX+tsbZZsw71Nq9Krtzg
         O6qpcQyfhsjACNiUeBcsSiU+DQE4nS85qLM7euDfxk3COeAj5y/QDpGUuH48PM/R399i
         vKDIiTZuo169tAblkIo5wq35tkFivfh32Ehqv1AWSdj4DxBWEWZXmuznGluLlx+bdN3Q
         e5fPVcesk17E+Bj74Qu/n/9IqLSwAUFH3WB2/Crb/KF8YcR1qtJwWgi8ISxYXyM6m7Dg
         rLB93Pap30lUaZxyeKJsfMA+jpAGPJ7NDjztnQSbRAaCx/QLq2ZFLUERhCWLJbkOZYJv
         GA+w==
X-Gm-Message-State: APuU4Z+nzqBGBKtyvyPABKKPBn2BxfjKn8C2a9zChuk2ixrkne3bUJDW
	1nakbMxaE4RGDjxwk1w5XlDvpas1XQwrEQpHj7bgd3D/UoV2Vp0Y6m/NkjipETBZHxkBPxICJpM
	DRUSFOmnp854QquWgBxvhr4AWourJbZ0PwLffF6hVEw0LhLedO9MTqeP/3pH18384epPQ/g==
X-Gm-Gg: AYBFou0TRwn0GMXlbwGqzhE4oJXXwnYp6P8sLbQ71+bWqHgVsDdGPH8G/xhSAkEmdkF
	5FcDAWMd6qv7VU9+8D5dvOiAbsW7apDGRFc0srwFt2vY2K/AhHQhLIySeGB04mdkBkcsT+RhKnU
	pt938+hu9VVwkIwQ/MwPNbBe355/v/c4pKpHpfLtsKIfMHDKinUg71cov+MFMMRrSEAUJKZpha7
	GN1leo7zGxr7qq8einPrE+dpeJXX9jNoKzM8FnuVtKxN3Nn/1FNOv7496yP7wBRy6h9NuikGszl
	U9U9KuoxwortQoVwUUzuoJC1O/cTJX7UJoGN52Yadtx79WTMHSP43/yyDMoyx9/2yFVSz7I+Qe7
	zkZY9VlkdrtpPQodSQxbzmzmFxiLu2HUOP8e+JwRZ6GioVL+i0TSYpZiHLfAkSJrrkC2X2MQNrP
	9kCqN0wHYxTw==
X-Received: by 2002:a05:693c:808b:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-3751fa3d519mr1949909eec.21.1794285223779;
        Mon, 09 Nov 2026 20:33:43 -0800 (PST)
X-Received: by 2002:a05:693c:808b:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-3751fa3d519mr1949858eec.21.1794285222941;
        Mon, 09 Nov 2026 20:33:42 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:42 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 19/19] wifi: nl80211/cfg80211: pass Instant Communication frequency for NAN offload
Date: Tue, 10 Nov 2026 10:02:42 +0530
Message-Id: <20261110043242.2012238-20-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
References: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX8cnX3nV0maBf
 b/IGy7BhavtKycrkrW9A8W9zRs9TJMmY5+ebc+llJeF87DDu/PsAdTHnGdNQI7UwHW2njVNdQ/E
 xOa7edwdH4CB9dmY6+7MbW4h80v4eIUPjtNWmE4vDBD+H52e4x3R1d7Q/T+fW54pWyobLKByaF9
 9BB0qMI/LjRB1M1wMNXGxJBDjfCMGe7EAxFUj7Mp1UOX7KFh7wkoyceRHBAdApUM2K6MxsJHbJ4
 Bn+5LpIDBlxs8ZHMxzqa5pFHM+clpSrk8oSW6d0sAJiD2+63rMuWsyBz2SQCVI04tZqNqrBHiLg
 VG6k6Unmg0lKSTCQm+SpohxsFPkBXs9GWkYoLgzWIh5NgyAq8jIua22FI4OuDLLeI0i5TvADGF7
 VkEc9RxWiloVFmptTLnoY33/8nIbqAb/gyL2L4koDX4RCc22mwXbzmgknWSeqwnuxEMugUt3EG6
 x+AprSCgLgqyf4x83Bw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfXyw9lScirl25A
 sRQdT/lB8/jRFXNDoQBujl9gnqZtFDkrBJ/ZUh2MD9Rg5Xwj8vwZAaynZS2vAGPsyLve+IqmAXj
 K/aUREyvy0buY98ahUNZF3NeRQ2hkbc=
X-Proofpoint-ORIG-GUID: BTWqnGgTz-lAzwhkOJuIDROXheCtUk9w
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af29ea9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mrEhVJ3C3bqI3fELwuAA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: BTWqnGgTz-lAzwhkOJuIDROXheCtUk9w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100017

With Instant Communication (IC), defined in Chapter 13 of the Wi-Fi Aware
Specification v4.0, the device has to know the IC channel. With a user
space NAN Discovery Engine, user space configures the IC schedule. A
device that offloads the Discovery Engine runs IC itself and needs to be
told the channel instead.

Add NL80211_NAN_CONF_INSTANT_COMM_FREQ for the IC channel frequency, and
require it when IC is enabled on a device that offloads the Discovery
Engine. Check that the frequency is an enabled channel in a band
supported for NAN, and pass the channel to the driver in the NAN
configuration. Reject the attribute without IC and on devices with a
user space Discovery Engine, which keep using the user space IC
schedule.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  4 ++++
 include/uapi/linux/nl80211.h |  9 ++++++++
 net/wireless/nl80211.c       | 43 ++++++++++++++++++++++++++++++++++++
 net/wireless/trace.h         | 20 +++++++++++++----
 4 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 6154b9c06029..551ad4636177 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4203,6 +4203,9 @@ struct cfg80211_nan_band_config {
  *	notifications.
  * @instant_comm: if true, start Instant Communication (IC) as defined in
  *	Chapter 13 of the Wi-Fi Aware Specification v4.0.
+ * @instant_comm_chan: Instant Communication channel, set when @instant_comm
+ *	is true and the NAN Discovery Engine is offloaded (i.e. without
+ *	%WIPHY_NAN_FLAGS_USERSPACE_DE), %NULL otherwise.
  * @pairing_setup: if true, enable NAN pairing setup.
  * @pairing_npk_caching: if true, enable NPK/NIK caching.
  * @band_cfgs: array of band specific configurations, indexed by
@@ -4221,6 +4224,7 @@ struct cfg80211_nan_conf {
 	u8 discovery_beacon_interval;
 	bool enable_dw_notification;
 	bool instant_comm;
+	struct ieee80211_channel *instant_comm_chan;
 	bool pairing_setup;
 	bool pairing_npk_caching;
 	struct cfg80211_nan_band_config band_cfgs[NUM_NL80211_BANDS];
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index c56428ce721a..c590f6170c36 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -8099,6 +8099,8 @@ enum nl80211_nan_band_conf_attributes {
  *	start Instant Communication (IC) as defined in Chapter 13 of the
  *	Wi-Fi Aware Specification v4.0.
  *	%NL80211_NAN_CONF_DISCOVERY_BEACON_INTERVAL must be set as well.
+ *	%NL80211_NAN_CONF_INSTANT_COMM_FREQ must also be set when NAN Discovery
+ *	Engine offload is used.
  *	This is a flag attribute.
  * @NL80211_NAN_CONF_PAIRING_SETUP: flag attribute. Enables NAN pairing setup
  *	and is advertised as "Pairing Setup Enabled" in the DCEA. Only valid for
@@ -8110,6 +8112,12 @@ enum nl80211_nan_band_conf_attributes {
  *	valid for devices that offload the NAN Discovery Engine (i.e. without
  *	%NL80211_NAN_CAPA_USERSPACE_DE) and requires
  *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_CONF_INSTANT_COMM_FREQ: u32 frequency in MHz of the Instant
+ *	Communication channel. Only valid together with
+ *	%NL80211_NAN_CONF_INSTANT_COMM on devices that offload the NAN Discovery
+ *	Engine (i.e. without %NL80211_NAN_CAPA_USERSPACE_DE); required for them
+ *	when %NL80211_NAN_CONF_INSTANT_COMM is set. The channel must be enabled
+ *	and in a band supported for NAN.
  * @NUM_NL80211_NAN_CONF_ATTR: Internal.
  * @NL80211_NAN_CONF_ATTR_MAX: Highest NAN configuration attribute.
  *
@@ -8128,6 +8136,7 @@ enum nl80211_nan_conf_attributes {
 	NL80211_NAN_CONF_INSTANT_COMM,
 	NL80211_NAN_CONF_PAIRING_SETUP,
 	NL80211_NAN_CONF_PAIRING_NPK_CACHING,
+	NL80211_NAN_CONF_INSTANT_COMM_FREQ,
 
 	/* keep last */
 	NUM_NL80211_NAN_CONF_ATTR,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 66ce4bc3e3a0..5843f8e793d7 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -886,6 +886,7 @@ nl80211_nan_conf_policy[NL80211_NAN_CONF_ATTR_MAX + 1] = {
 	[NL80211_NAN_CONF_INSTANT_COMM] = { .type = NLA_FLAG },
 	[NL80211_NAN_CONF_PAIRING_SETUP] = { .type = NLA_FLAG },
 	[NL80211_NAN_CONF_PAIRING_NPK_CACHING] = { .type = NLA_FLAG },
+	[NL80211_NAN_CONF_INSTANT_COMM_FREQ] = { .type = NLA_U32 },
 };
 
 static const struct netlink_range_validation nl80211_punct_bitmap_range = {
@@ -17372,6 +17373,40 @@ static int nl80211_parse_nan_conf(struct wiphy *wiphy,
 			nla_get_flag(attrs[NL80211_NAN_CONF_NOTIFY_DW]);
 
 	conf->instant_comm = nla_get_flag(attrs[NL80211_NAN_CONF_INSTANT_COMM]);
+	if (attrs[NL80211_NAN_CONF_INSTANT_COMM_FREQ]) {
+		struct nlattr *ic_freq =
+			attrs[NL80211_NAN_CONF_INSTANT_COMM_FREQ];
+		struct ieee80211_channel *chan;
+
+		if (wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_USERSPACE_DE) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    ic_freq,
+					    "Instant Communication frequency requires an offloaded NAN Discovery Engine");
+			return -EOPNOTSUPP;
+		}
+
+		if (!conf->instant_comm) {
+			NL_SET_ERR_MSG_ATTR(info->extack, ic_freq,
+					    "Instant Communication frequency requires Instant Communication");
+			return -EINVAL;
+		}
+
+		chan = ieee80211_get_channel(wiphy, nla_get_u32(ic_freq));
+		if (!chan || chan->flags & IEEE80211_CHAN_DISABLED) {
+			NL_SET_ERR_MSG_ATTR(info->extack, ic_freq,
+					    "Instant Communication channel is not usable");
+			return -EINVAL;
+		}
+
+		if (!(wiphy->nan_supported_bands & BIT(chan->band))) {
+			NL_SET_ERR_MSG_ATTR(info->extack, ic_freq,
+					    "Instant Communication channel band is not supported for NAN");
+			return -EOPNOTSUPP;
+		}
+
+		conf->instant_comm_chan = chan;
+	}
+
 	if (conf->instant_comm) {
 		if (!(wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_INSTANT_COMM)) {
 			NL_SET_ERR_MSG_ATTR(info->extack,
@@ -17386,6 +17421,14 @@ static int nl80211_parse_nan_conf(struct wiphy *wiphy,
 					    "Instant Communication requires a discovery beacon interval");
 			return -EINVAL;
 		}
+
+		if (!(wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_USERSPACE_DE) &&
+		    !conf->instant_comm_chan) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    attrs[NL80211_NAN_CONF_INSTANT_COMM],
+					    "Instant Communication offload requires a frequency");
+			return -EINVAL;
+		}
 	}
 
 	if (attrs[NL80211_NAN_CONF_PAIRING_SETUP] ||
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index e893dbbe66fe..d5e29aa98089 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -2387,17 +2387,23 @@ TRACE_EVENT(rdev_start_nan,
 		WDEV_ENTRY
 		__field(u8, master_pref)
 		__field(u8, bands)
+		__field(u8, instant_comm)
+		__field(u32, instant_comm_freq)
 	),
 	TP_fast_assign(
 		WIPHY_ASSIGN;
 		WDEV_ASSIGN;
 		__entry->master_pref = conf->master_pref;
 		__entry->bands = conf->bands;
+		__entry->instant_comm = conf->instant_comm;
+		__entry->instant_comm_freq = conf->instant_comm_chan ?
+			conf->instant_comm_chan->center_freq : 0;
 	),
 	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
-		  ", master preference: %u, bands: 0x%0x",
+		  ", master preference: %u, bands: 0x%0x, IC: %u, IC frequency: %u",
 		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->master_pref,
-		  __entry->bands)
+		  __entry->bands, __entry->instant_comm,
+		  __entry->instant_comm_freq)
 );
 
 TRACE_EVENT(rdev_nan_change_conf,
@@ -2409,6 +2415,8 @@ TRACE_EVENT(rdev_nan_change_conf,
 		WDEV_ENTRY
 		__field(u8, master_pref)
 		__field(u8, bands)
+		__field(u8, instant_comm)
+		__field(u32, instant_comm_freq)
 		__field(u32, changes)
 	),
 	TP_fast_assign(
@@ -2416,12 +2424,16 @@ TRACE_EVENT(rdev_nan_change_conf,
 		WDEV_ASSIGN;
 		__entry->master_pref = conf->master_pref;
 		__entry->bands = conf->bands;
+		__entry->instant_comm = conf->instant_comm;
+		__entry->instant_comm_freq = conf->instant_comm_chan ?
+			conf->instant_comm_chan->center_freq : 0;
 		__entry->changes = changes;
 	),
 	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
-		  ", master preference: %u, bands: 0x%0x, changes: %x",
+		  ", master preference: %u, bands: 0x%0x, IC: %u, IC frequency: %u, changes: %x",
 		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->master_pref,
-		  __entry->bands, __entry->changes)
+		  __entry->bands, __entry->instant_comm,
+		  __entry->instant_comm_freq, __entry->changes)
 );
 
 DEFINE_EVENT(wiphy_wdev_evt, rdev_stop_nan,
-- 
2.34.1

