Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565421;
	b=sajTLhhbKwKBN/EWhDCCqUC6mhaADzSyMKATlgSo2F4cSKahwlnHRBZf7zxQGMea6bgQ
	 tTfg3zIfMBick9IrWB57NofURHoVhQ9Lp9uZFzrHpE8FJ+f5dicSAWo29qaJDtgyEebcD
	 LokeLNFe8h+rfkHrDzVnx4LikNRoIYGlRG1Py0U5ja8BkZJtzu1pCZJuQOl5HNsB75dqP
	 /PmqHlU/VSseTK1fRZzLQDaJWwgO2NuW/1b/YzyhTuACw+YDeJwNiEBgsPyEFme52cmh9
	 krZrd0MxjOrGyGRzkKB78hiy3vFC0dzQS11OJLj6E83y+LZ9zjY/0Yimndi1gVbhAcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565421;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uUIXPo89M4VpGWT+5h6zkU+vVpSAO6r0NYDwsu+x0AY=;
	b=svlHWd0E+MFtNCEdudctnAiYgRVQzjYKWaGdydKL3Uli2MCgAn6nGxcNt9T1WtbTk6sX
	 p8YqSNAVcrlEWOYpcGlPZZDk8gZW2Kp6qigs8CuwD0BOXXvsDhg0jn4bGiV3krM9ti5uP
	 m9MJ34cDvBfHVh35tmFL5Y35cwKfvwrAI9f2tpZJd0cE7y7JXkccopO29zcIhfYDevdan
	 jzFFPuzCRCyoOj9MoD/NwP6kSusJSC1acOsRUjivgbabGj1rKxERh7D55FFP4EMadCXn4
	 B3/wRbKl7DyYua2y2a53Um9TzLWccgPs6TCWmbJRJDcuRujrZFPzAIJzjveYBqqtlaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PEdbCMja;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNaSLriR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F5E606A880
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36F5E606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PEdbCMja;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNaSLriR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VS7S1527728
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uUIXPo89M4V
	pGWT+5h6zkU+vVpSAO6r0NYDwsu+x0AY=; b=PEdbCMjaSw6qBI74wIgnlQMiRz+
	DzKVhXELBaYy3/ouZDNyMDhtzw2Cr6KD49c3Z6Xpv4+8b7s/5Yk8cPObf9TsPOLF
	FH8iBUBb+hqWJxIpzZvfFqBXF0tKKaSaktTMQJV9dTENpjHPG2ZahQY4UpBpWbeU
	asbMhRya98Gv2c39GSU7dMXchRJLvVHJF4+qL9q18fYAL9s3OPq633gVip8diR/J
	lWc2Waognky6HoEUajcBMLW7dLIBfC28c/aNMjm+RYS4YGcfHIHF1BR0p/UJkLpc
	kqeD9qp8dXZSiSwO+X8DS+I1Z5x9aY7HgjFrAus8DUtfLFrEmd50GmAc4+w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8tgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so582540eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565419; x=1795170219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUIXPo89M4VpGWT+5h6zkU+vVpSAO6r0NYDwsu+x0AY=;
        b=PNaSLriRM00Q6/VnsMCdZW+lmF7J4ACMnW9APbEkGu+kOPXCljNSC9efmv64fmoCvx
         weCt+W/0mmrRdjSfqyvaEg6Vr11TC6vO/Ve2IKtnwRlrtHdhbSu4pDo+jCdqlpSWWspr
         6i1b3dGXB5EsGfpacwHtonZWURifO8q9K9ElMi//T4TrmDPbtD6pDphlGGsw6Pa2Q8MR
         nuOWKeDPWTAKWiL0xwH4QWfmmt9isRJ79XjSAhMYAmuWfopEg3LVIcZUQYQdkBvnL1c0
         /sz/wWUeYKlg6MqRwRW74ZoQpMFMat2ajzJgbZi1DJw1vktUFljpzQnEcpljXEH0IhKQ
         p0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565419; x=1795170219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uUIXPo89M4VpGWT+5h6zkU+vVpSAO6r0NYDwsu+x0AY=;
        b=isfsc79YV3LU9bRxIR8Xnxl+S9I7Qf0oeqraRSWjih6KjMezTObO3NhfItf68BhO/H
         7Wb/O0rW/EYM2XMIQIuRn1UZI6KrEuNLLohT10mibKfVpJfSS07HQFUDVhBwoUCYm3og
         GRHt/Kps/xguv5MmM6pGMHzgmw1yCg323xWv0Ul8OQU+9Y16OhM6pjj1hSPfYzGwohaK
         iOp/uY0BKS3KvAly6KPGD8esX9xlyqsIodAsv5SvD0/sbhYOm5rfAHadVvhzT4cvpszF
         KS1Uhplqtr6duFdyaMpUGqcSq7OXwKXj8G2WlhPmFwcOD62KZCbMr+7LvnzJZy4MGVRJ
         LigQ==
X-Gm-Message-State: APuU4Z9uteryG0RxVqho5jUFNltmFre4AdC38XJeS1Yy0I4FlDc3+/5t
	mqK45MqtJq8LqHafm/a8aCtnfTJYyt4lKL8rmSUk/l+D32/gQDSVcF/JOWsndDzuIP3d/x4PBeP
	m7JPyO/k58rwbZfGqBHma+MvNJUR9zEwajeQZiZEYffchRHnG+vcFSCw11ttSccVgbzTxRg==
X-Gm-Gg: AYBFou3jyezUNOD0ybvYT2Ze4C5xshmhhMQeAy2O2rTmlo8E4tqCFID0QMdKA17uokU
	kbFgl3kdlAqOwpFCdfXVyts+X07fFsfZt5wSYu6UfXieN499jmdvpCdBzJC/US6RQmY0GaxSFoH
	7FkExYAcJXFKSlmULV+nxgt0QUsQTzeP380k1A19a6iPl/zhQbfOciJt8njKAmk0Bx2GzQd/bKi
	/ZBhScck4uEeapmxg5oyRwEQBTYfqaW5djecvUFXqaovdL2d9ja1DQXTTmdGL2LDekI57dbX/pt
	A2mUiMUD2HU7Fkp51uj2L+2jeTZ0i9pmaZuIix9TVjh8/Cx/TFa07AWKzz6DzLgcOz03KE4s7L6
	XocjBxRg5zvfqK8an7N/8RnBJZxqqfa9HtzbGwMQXm/xLYDF9gl/L35bvbgSGyNYYDG/hL4xuyz
	ujMFN5zxma+ec=
X-Received: by 2002:a05:7301:4104:b0:36d:dcdb:70c5 with SMTP id 5a478bee46e88-377e15f06femr6879946eec.20.1794565418733;
        Fri, 13 Nov 2026 02:23:38 -0800 (PST)
X-Received: by 2002:a05:7301:4104:b0:36d:dcdb:70c5 with SMTP id 5a478bee46e88-377e15f06femr6879924eec.20.1794565418169;
        Fri, 13 Nov 2026 02:23:38 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:37 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 19/19] wifi: nl80211/cfg80211: select the 5 GHz NAN channel for IC
Date: Fri, 13 Nov 2026 15:52:28 +0530
Message-Id: <20261113102228.1917973-20-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113102228.1917973-1-shivani.baranwal@oss.qualcomm.com>
References: <20261113102228.1917973-1-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX3WgXEDssZr3r
 O/BXaIRBpZX2JEjsFNBhMw5ZAgOqOzd9Ng+rRyLZ3NnCMALJbOgGekXlYBQBn90GvIi9KjE2QI0
 RbYUhrPyqK+ZVMOHfK98amQ9yPSa17Z7DN35rRgfrDMzkcwhT8svrOrBJr7oTPeJdq013yy9VeF
 hQcq7q1gZ6xce8nrYcRw/xtks/YdZx2x6zz9hLw1d8JtSa6jJnbNadlFM20uYHg5CvOFB1sFGA/
 o4Dj64ESC8KSlG85+FnWylgJ5MrZCWGr5qdqBuo6BUeReMw1ynEg/k5cHYiJF2Llms6utCxi/6r
 /MFM7YW08hY/bwxamyXYULSA66ZRqSYWvxIHsUOOdBKhLSkF8GZvSlXBKNAttEAaQjQrZ6BEFRw
 8hzcZOrE2YxPlpbWgrV5Fnd2bR+0zaIOKcOvCY8Ab7H3BZ6KLg/v0D3nK62X0PDUbTiopX43gv1
 4J3AYKRYXNZfzbEKBfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX5wofHvJNUCw5
 k93lj61bUmgRis14PZzu1sRCorTjhLtIBmgUA+4kFDGguPXtVKYN5aCI0V1X46ATYCBzlm5Qo4t
 b4zmKKMzewNqNmfYzmotJ1y1FgYlWhQ=
X-Proofpoint-ORIG-GUID: Eh7h2wAydP2xJteUYeUw58OF8GezTGFj
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6e52b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=lCFahssyvdblv_5ugMgA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Eh7h2wAydP2xJteUYeUw58OF8GezTGFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

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
index 9b105379f3ef..ccb0994eb94d 100644
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

