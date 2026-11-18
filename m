Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983824;
	b=hB4HBtrB503/MYQBFceqMZgB1PoAtTJ1tagdHqjKni5Du9Nxgdh0QaqDtEmRpzMA8ZYY
	 lsYtIuS66hrWmw0hACgYMHzKAWmj/Fwo3oJ47KujVDJQbGRb6crcDAIYTozDrHVVIZft8
	 p7nB2/+l45bdml+PQ2Kcfg9EEzT6pixZBRzhHaQGjBMC3MkmtWIVkxA9mSAwmK7HG102Z
	 dhhOp6igLUe71oUETYY8VNci1WOoFunMngVfEQcGeHc/rnKJq9Ftx5tYP+BeeDHWc8fDo
	 Qh/RzD5uVnH0l2HiJGudpZTavUGFSfI2n0/nz8zCisCU2GZ8Vf9kQ5eREeH/AF+9Ufw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983824;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8F5/QehVt6L6R7weWB0TfsgE7bu1wBO/68Lu+v3GYok=;
	b=DMVH02Tdo40foF0391pMO7z4gAydk0KQ6wOGLO7BtHDnsOBFvusrccDMj4VAcWnyMYAo
	 74Mjqdq3FCPDAC2BFOnH+N7NtM336a4AlSh2scQhmaBkPZI4RxxFKbfoL8HpQ0J7Ifkhp
	 DYeBOdPoUqeHYR6Z5hxDvSY3UOpkVD+larRdlXABEzp12mfi6RdWtR0DlhRp5xZpnrhyP
	 n/fV6Y8LiuLG5K21uln0KXkXux7BE5Hv3uJWTgg40EWNDwx+BKu+u+C4S4jDTdq+pQqLk
	 ObFb2ikn/BRkLaH3cN3X8mZVZ6KBQaFP4xc4GlBFugyQ+wyognXXarxdAbwQBcIhWHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EV7G1BDd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PxN5is+f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4FA606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA4FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EV7G1BDd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PxN5is+f
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2u31959902
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8F5/QehVt6L
	6R7weWB0TfsgE7bu1wBO/68Lu+v3GYok=; b=EV7G1BDdpUN4zyY8C/MwhQ2wV7d
	bswao30WYsaY0mpYvDPw8WEpa01oEoGmF9LuBX23bKhWIMS4Qi7qBCxdFfwHznVU
	6LZz5V331CPERN1RJ/L6GgW2TjmmTEEHbejvjBJ/bwSNjk9qFsasm0ZNvHllafGK
	ZrWGOo/q27jTx/Z4eV0nEvCWZpEFQpA/ll1DaR0HjDpYeWsuspo1LlQ1wgtZWb5L
	FVzWIEPt6wClOtT8r8/UKdOrEO75kk/ujnHX8SMdrXWMS6WErrDdzW0Kc3uWvTXD
	zqf4mGasIz5g99hT7R17Dj0LgJIauBL3OZCo8mkuTk21pMyMqRG379yfQHQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hk9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:37:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3821eb27024so595265eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983822; x=1795588622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8F5/QehVt6L6R7weWB0TfsgE7bu1wBO/68Lu+v3GYok=;
        b=PxN5is+f+FnxlaEnyxoVUKO5UV/GvGFcIvkvxpTx6lpqWnPvyFREPx+eE67pFLQDEy
         WeUq6lrBRoXtd8bifjqpzvT5hLS5UehKsJ8cMEfYGnHwGnkNeOqCfka8zOarY1A9m2wV
         +97uTZPUibRi0fqkYrIvoRc8F63wEmbKYlA71+Y7AQgzNocV6gRGe0tGkCRD6i2ntRuy
         ku0r6W5Ybv0p59LqSBsY5jglBNJl8v101QL0AKDLMW5QfsObjEUO1gPeXHLzK2fDhX2V
         saAMBBeoXPtYMawMyXjw+Wi/xVybJcUeUmCS3xYAfdsrI60CZXtxTzn45bzygvXcscMw
         O0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983822; x=1795588622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8F5/QehVt6L6R7weWB0TfsgE7bu1wBO/68Lu+v3GYok=;
        b=OKM1/MzDx5pySTm7uFwTU086VQEMGRdirjxSNcp3DJvRHwZD2Tbl6/bo5HQ+iAyw/H
         TxPlQ7KLDrb203tnYXbtfSPDAp5D5tTuhXH3FKvlG7b+R99EJpmZu+XSYrDq/gNXM21g
         kOvbayX5IzjSMupu/EcWeKslGXJCpaLyNFTzyH7RqXHwO/tHFPIEXd/V4nMTgbhy9nis
         Q5mOXD5XeLk6mAvE78gmYSgB53/NfYMADoj3X+NB+bOtsj6b0R/3dgqKiKXw5PYE2FG1
         qYwQfhiYlHOEPMA4stOGZ62Er3PBpPjfccvPlLz6rLi0WJn/gRS1JpYXwyg0WWfLF8Ok
         CxRQ==
X-Gm-Message-State: APuU4Z9Ln5i3QGmbhLIuCvHUXwjS2RVN5zybCSju89PBAb3Iy+ViRGTL
	S9S03lF/3VRvJJARPJfVdXznwyVOBjO9+OlXQOyrGlqp96lOvGp0P/+MbWIiC3RsmJJ09iDAtEU
	xpcP21iCoDeHMXN/xI4CzQSWPWt4IO6JawKCophSYpWIr6JJLSIYfpI51V9NIn/H7d3uJzQ==
X-Gm-Gg: AZFdTZdFe9G42NFVgh8rCmuMXQXcAnmESZYNimkV2BdB0SkGTWhSNiH24HOvZny5uxU
	md52fjYI4Y07Nl7NNzqtRuBCTFcflO9xqRFW9yfb+YadEYPKd/yXucRWLhd2sVpf1k808JAwj1c
	dzGyM+rX3/7dXyjZPIrSlMV4mm+tXEKlihewzBDhumS4saBzw3ILEznm7hDJbzVUWZ0M2Kt9Xts
	QQEFutVe7etPZBic3ZMTaZqKNcvNx2BY1Gi6IO95bePXXew6lds3tbwwTYuvL32vm18fkn7RUje
	Z0FkveWiucmzmEfnTu8cLK6HMGdwXY8BBQgCnuHBN0a98CLPJQllyFNDMDC7K/cuWwlA/FkFJXd
	4Tu8Up8zcXYyOBiRMi3q8u8A+HA9VaR87JUPem2VeJwl6W6bbuE9y4M3W4XTCD6nUvgk+2NKous
	McwdcjpmTJ5A==
X-Received: by 2002:a05:7300:f408:b0:369:f035:661 with SMTP id 5a478bee46e88-38280a3c1f8mr1790222eec.15.1794983822304;
        Tue, 17 Nov 2026 22:37:02 -0800 (PST)
X-Received: by 2002:a05:7300:f408:b0:369:f035:661 with SMTP id 5a478bee46e88-38280a3c1f8mr1790192eec.15.1794983821378;
        Tue, 17 Nov 2026 22:37:01 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:37:01 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 19/19] wifi: nl80211/cfg80211: select the 5 GHz NAN channel for IC
Date: Wed, 18 Nov 2026 12:05:54 +0530
Message-Id: <20261118063554.2260397-20-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118063554.2260397-1-shivani.baranwal@oss.qualcomm.com>
References: <20261118063554.2260397-1-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd478f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lCFahssyvdblv_5ugMgA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: t2AHIScqzkH86yFdh2s75hbAkwebDhrR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX85oMbjt8bxOo
 /A9hj8Fd/yQhSfNmBXwFqCEUID+essczc3b6nAIYuWQRee7rD0KBUTY7qHK5PjrUP1XGTxTxNS9
 UbhspCJ+qkGnzpUaXlQQDgEDB6ifDZSt2oN4FuwvgmdqLVzo3V2p4yYq+VWI9t9yHGSjEq3eYiP
 vEpQ0MDi+n9MnE+TNICvgdma78vc6l/kCLzMlQSl7rd79+M5O2CQ8KMKlrtSmiKa7c5MrO3q/YQ
 PB46GMmB/ubUDitPrdU0hgv8elCmDCeNzpnBDm+68s+QeQsS6Y5P4SzHzTYou1qeZq0uz3qVQF3
 W7+/p6NW/Lv5D3njLIvVGtS1txwot5juJyKBPF76ZK5kSU79B4XyzsOpWxBpj2cKoYs7/p7xNPQ
 FuK5XzBD5Odzy83iTKftNsn0POLXMn4SLZ9W3eJqdfqy45LPW+963FBPT14w1ylyralBGeP8YtZ
 u+Az6qXASvVIFtOrtFA==
X-Proofpoint-GUID: t2AHIScqzkH86yFdh2s75hbAkwebDhrR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfXxUDMCG1J3xCH
 GjCic1gxciCI8faxHlbUFFUQt3jHngJ6l5+H6eI43cUtASqlgg1bpa1ZaNh504coJVvRpEuDWX4
 JrBqwMekXQpVM7iAo3tMuggSKo6NQrk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

Wi-Fi Aware v4.0 specifies that Instant Communication (IC) uses the
5 GHz NAN discovery channel when the intended peer is known to support
5 GHz; otherwise it uses the 2.4 GHz discovery channel. The NAN band
configurations already provide these discovery channels.

Add optional NL80211_NAN_CONF_INSTANT_COMM_5GHZ to select the configured
5 GHz channel for IC. Without the flag, IC uses the 2.4 GHz channel. The
flag requires IC to be enabled and a 5 GHz NAN channel to be available
after band defaults are applied. Its use is independent of Discovery
Engine offload.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  3 +++
 include/uapi/linux/nl80211.h |  8 ++++++++
 net/mac80211/cfg.c           |  1 +
 net/wireless/nl80211.c       | 13 +++++++++++++
 net/wireless/trace.h         | 18 ++++++++++++++----
 5 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 9aae48c2b95d..96dfd5d397b5 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4249,6 +4249,8 @@ struct cfg80211_nan_band_config {
  *	notifications.
  * @instant_comm: if true, start Instant Communication (IC) as defined in
  *	Chapter 13 of the Wi-Fi Aware Specification v4.0.
+ * @instant_comm_5ghz: if true, use the configured 5 GHz NAN discovery channel
+ *	for Instant Communication; otherwise use the 2.4 GHz discovery channel.
  * @pairing_setup: if true, enable NAN pairing setup.
  * @pairing_npk_caching: if true, enable NPK/NIK caching.
  * @band_cfgs: array of band specific configurations, indexed by
@@ -4267,6 +4269,7 @@ struct cfg80211_nan_conf {
 	u8 discovery_beacon_interval;
 	bool enable_dw_notification;
 	bool instant_comm;
+	bool instant_comm_5ghz;
 	bool pairing_setup;
 	bool pairing_npk_caching;
 	struct cfg80211_nan_band_config band_cfgs[NUM_NL80211_BANDS];
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 8976154fdfcd..aaf65f693fc5 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -8200,6 +8200,8 @@ enum nl80211_nan_band_conf_attributes {
  *	start Instant Communication (IC) as defined in Chapter 13 of the
  *	Wi-Fi Aware Specification v4.0.
  *	%NL80211_NAN_CONF_DISCOVERY_BEACON_INTERVAL must be set as well.
+ *	If %NL80211_NAN_CONF_INSTANT_COMM_5GHZ is set, IC uses the configured 5 GHz
+ *	NAN discovery channel; otherwise it uses the 2.4 GHz discovery channel.
  *	This is a flag attribute.
  * @NL80211_NAN_CONF_PAIRING_SETUP: flag attribute. Enables NAN pairing setup
  *	and is advertised as "Pairing Setup Enabled" in the DCEA. Only valid for
@@ -8211,6 +8213,11 @@ enum nl80211_nan_band_conf_attributes {
  *	valid for devices that offload the NAN Discovery Engine (i.e. without
  *	%NL80211_NAN_CAPA_USERSPACE_DE) and requires
  *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_CONF_INSTANT_COMM_5GHZ: optional flag, valid only together with
+ *	%NL80211_NAN_CONF_INSTANT_COMM and when a 5 GHz NAN band configuration
+ *	provides a discovery channel. When set, IC uses that 5 GHz channel;
+ *	otherwise IC uses the 2.4 GHz NAN discovery channel. Wi-Fi Aware v4.0 uses
+ *	5 GHz when the intended peer is known to support it.
  * @NUM_NL80211_NAN_CONF_ATTR: Internal.
  * @NL80211_NAN_CONF_ATTR_MAX: Highest NAN configuration attribute.
  *
@@ -8229,6 +8236,7 @@ enum nl80211_nan_conf_attributes {
 	NL80211_NAN_CONF_INSTANT_COMM,
 	NL80211_NAN_CONF_PAIRING_SETUP,
 	NL80211_NAN_CONF_PAIRING_NPK_CACHING,
+	NL80211_NAN_CONF_INSTANT_COMM_5GHZ,
 
 	/* keep last */
 	NUM_NL80211_NAN_CONF_ATTR,
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 9e47360ee8f5..ed5955c94d5b 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -369,6 +369,7 @@ static int ieee80211_nan_conf_copy(struct cfg80211_nan_conf *dst,
 			src->discovery_beacon_interval;
 		dst->enable_dw_notification = src->enable_dw_notification;
 		dst->instant_comm = src->instant_comm;
+		dst->instant_comm_5ghz = src->instant_comm_5ghz;
 		memcpy(&dst->band_cfgs, &src->band_cfgs,
 		       sizeof(dst->band_cfgs));
 
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 34d2072eb4cd..7a38705722a3 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -905,6 +905,7 @@ nl80211_nan_conf_policy[NL80211_NAN_CONF_ATTR_MAX + 1] = {
 	[NL80211_NAN_CONF_INSTANT_COMM] = { .type = NLA_FLAG },
 	[NL80211_NAN_CONF_PAIRING_SETUP] = { .type = NLA_FLAG },
 	[NL80211_NAN_CONF_PAIRING_NPK_CACHING] = { .type = NLA_FLAG },
+	[NL80211_NAN_CONF_INSTANT_COMM_5GHZ] = { .type = NLA_FLAG },
 };
 
 static const struct netlink_range_validation nl80211_punct_bitmap_range = {
@@ -17392,6 +17393,9 @@ static int nl80211_parse_nan_conf(struct wiphy *wiphy,
 			nla_get_flag(attrs[NL80211_NAN_CONF_NOTIFY_DW]);
 
 	conf->instant_comm = nla_get_flag(attrs[NL80211_NAN_CONF_INSTANT_COMM]);
+	conf->instant_comm_5ghz =
+		nla_get_flag(attrs[NL80211_NAN_CONF_INSTANT_COMM_5GHZ]);
+
 	if (conf->instant_comm) {
 		if (!(wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_INSTANT_COMM)) {
 			NL_SET_ERR_MSG_ATTR(info->extack,
@@ -17449,6 +17453,15 @@ static int nl80211_parse_nan_conf(struct wiphy *wiphy,
 		}
 	}
 
+	if (conf->instant_comm_5ghz &&
+	    (!conf->instant_comm ||
+	     !conf->band_cfgs[NL80211_BAND_5GHZ].chan)) {
+		NL_SET_ERR_MSG_ATTR(info->extack,
+				    attrs[NL80211_NAN_CONF_INSTANT_COMM_5GHZ],
+				    "5 GHz Instant Communication requires IC and a 5 GHz NAN channel");
+		return -EINVAL;
+	}
+
 	if (changed_flags)
 		*changed_flags = changed;
 
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 85eb81d0d87f..f12dbc42dc54 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -2387,17 +2387,22 @@ TRACE_EVENT(rdev_start_nan,
 		WDEV_ENTRY
 		__field(u8, master_pref)
 		__field(u8, bands)
+		__field(u8, instant_comm)
+		__field(u8, instant_comm_5ghz)
 	),
 	TP_fast_assign(
 		WIPHY_ASSIGN;
 		WDEV_ASSIGN;
 		__entry->master_pref = conf->master_pref;
 		__entry->bands = conf->bands;
+		__entry->instant_comm = conf->instant_comm;
+		__entry->instant_comm_5ghz = conf->instant_comm_5ghz;
 	),
 	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
-		  ", master preference: %u, bands: 0x%0x",
+		  ", master preference: %u, bands: 0x%0x, IC: %u, IC 5 GHz: %u",
 		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->master_pref,
-		  __entry->bands)
+		  __entry->bands, __entry->instant_comm,
+		  __entry->instant_comm_5ghz)
 );
 
 TRACE_EVENT(rdev_nan_change_conf,
@@ -2409,6 +2414,8 @@ TRACE_EVENT(rdev_nan_change_conf,
 		WDEV_ENTRY
 		__field(u8, master_pref)
 		__field(u8, bands)
+		__field(u8, instant_comm)
+		__field(u8, instant_comm_5ghz)
 		__field(u32, changes)
 	),
 	TP_fast_assign(
@@ -2416,12 +2423,15 @@ TRACE_EVENT(rdev_nan_change_conf,
 		WDEV_ASSIGN;
 		__entry->master_pref = conf->master_pref;
 		__entry->bands = conf->bands;
+		__entry->instant_comm = conf->instant_comm;
+		__entry->instant_comm_5ghz = conf->instant_comm_5ghz;
 		__entry->changes = changes;
 	),
 	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
-		  ", master preference: %u, bands: 0x%0x, changes: %x",
+		  ", master preference: %u, bands: 0x%0x, IC: %u, IC 5 GHz: %u, changes: %x",
 		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->master_pref,
-		  __entry->bands, __entry->changes)
+		  __entry->bands, __entry->instant_comm,
+		  __entry->instant_comm_5ghz, __entry->changes)
 );
 
 DEFINE_EVENT(wiphy_wdev_evt, rdev_stop_nan,
-- 
2.34.1

