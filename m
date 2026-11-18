Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983799;
	b=m1ovXxmhi8cIG03dMf7cTu5qKtsOch9IcqJ6bP1POrvdG6pYXpETKXnvI7hjEl86c3wG
	 mLZimg+y4uvhkgOqrC+ln0DRw0fGSOJ89BaRSTrV8ji+GsLRSbS0+WAJJLY7xQzCNpQNe
	 5Gkf44pFDXbpTdTh0HVohJ0r4xYgYAY7AhbC5AK1gZlsjivYBQEy2XFjkRzU9j0jyj4hS
	 C02jS6cJPr+bS+kmngTbc0Z9SigcUk7SZO9UYbVqzJ+Wj4Lhh6P8qehWaoq0ssK1egWWW
	 t0HRLBiiiIdDvTKn/34CIhhUi/+B6mz3jYhQORoxzuzWoyT//M6BpKawzvSujfrVS7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983799;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hg0xxsHsLWTxaYKionkmWS8E8vlKQkMIlVaCp0wEbBQ=;
	b=HgrAKEQDbO+KzBq+6teG9Ng0R2iDceajWpWtlaxEoGJJaFZ8ia1d3EAc3rZF7DTKHZ+i
	 g9BXp2OlwRWN/2YyaFIuGR8NFnlgB17PopO+w0ZIOj7s21BOc3zeOv9aPnrRmNyce0nmI
	 /NrFGYvZDyAN+yU3Wd01c1fbmwYg1o6TwE1q/j63j6fJT0leljbVsLZ72vyr2cKdtmMlF
	 cHbkmDpoxXhkhrDnF1+E6+7O4jnoAv+ZDFOsuALnvbLgVkD3XzM8rAp/9uImTAskP9nYg
	 5VD2SWjSf+KqihHcuUtZIil/2wGnVD/128JIBGRljV9XqxvHFtAuYxCm2J8sjs5royA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FDfz6WUW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HEbrTKHh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4E2606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E4E2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FDfz6WUW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HEbrTKHh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uq8x2383049
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hg0xxsHsLWT
	xaYKionkmWS8E8vlKQkMIlVaCp0wEbBQ=; b=FDfz6WUWXN03/UYzcEx3sLFp3KV
	wCWttzmX/iUe51DQsSMkrC6t0dgPbQOURA6CcL0I2nbxzkvSei+14NrgSEqNb3+P
	2CblKmMDvlJGtnCyA3WRFlu41oVM+ms5fhVencj3ViKKHTatXwLnEcV80P4r0SkN
	8HVFVr+gKgd7hFDmVb5mku3tNzNSKRbyyR4we04D4B6ZH+rXxAfhXga8rDXTwL5m
	fOKXLAQx8eJLnr6tBTjkpOT1k1bzZT4NMvpLJhYjQ6cpS8OUG9KXaHKjmKgNz4qF
	QzYuO6K9WawM4GZMI76vzkXghjo2FmeESnOejAdlvYhHFt4GdFXDkuPzH9g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasmf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so445393eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983797; x=1795588597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hg0xxsHsLWTxaYKionkmWS8E8vlKQkMIlVaCp0wEbBQ=;
        b=HEbrTKHhz9eyyakTkcNoLSE1iNzddc4EHXZO5YnZZaWFbjZmgt5xWMDv+6yaTF3vcL
         O8AxERIyheO0Q+xL2Ecqa/S3zqawNNLm/8al8ThqeI5Hy7KtOXEddDmOVCnlF22TrOJv
         ENrUnh96WlFHvWWMLZxUg4nf88kIIP+Yj6qYEVg7gt+UtZ7hkZbBlIkVVEQjjvOsGqcJ
         WO07F7AIilAHkzrYfjvextWxfgJrx08lO1q95c48V09X7SyX+n2LEm4X/3NhrX9vcXRS
         HOR5mYGhjlIYE1+YdQr4vxNloAE72+zuT/7+9KgyKp6APZ9kQ7GxFh9NuQpHv3nKIhN+
         n51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983797; x=1795588597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hg0xxsHsLWTxaYKionkmWS8E8vlKQkMIlVaCp0wEbBQ=;
        b=0fOgYv3aaY11RaLb1va7CdbL7THg+SJv9yns47YYIA4IIRlP7srUH2ck4aMMT70lFr
         4YhZvxspkDaU3YeyUzEum1WCFGoehGVp0KizXiwvsAHNs+cSFfOymFURPDwmIAZRt3S7
         faW52BjjTCGQEZEEheEO0VvsMRNSdlSqsLw3wEaLJbFSRk5tGfe7z5VWpr0gl2wU4ggS
         j8MtP9LWgtpzPfRGLgRis60KHpOPG7ylcjQMvgEUbR4kUjtoMcVUnWOogz0MfG2GANfY
         BnlKIS8JrhG/L5cEW2Jm4EqIZ+d/gW4euHxZrf96ZkEFHJOI003QkZyCYCjHtqso0LSP
         4xjA==
X-Gm-Message-State: APuU4Z+rY0M2uz6e1TCeP8czvMyBwNbIe96ViUwphW1mD6lz0PNbjHv9
	Gptxkusp+YXSSOSVGLbd/xvJwzdoz4ANZy6XBP1gZGCV/3dD7exwt5XzPrm00WeKAPSsBlod1I7
	WUP2RRQq5REbFE9H4/qndCVdJFiWq7Sl56UB8v1OAGD8a0bxPBio7wFvYzdPDIIn7jCKjfQ==
X-Gm-Gg: AZFdTZcOPiF4MDeFrKu4dhRNJHsp4ZdDBLRKrQ7kkZ38YfaE6wwlnR/EiuHeygN2hi4
	AAETi6TsHfND3FSBDSEPSZasmGeKKQFClXRsQaLbGe67N0coRIZOpzaVQu7StDqbQeN/2IBxtYL
	LRBsL5nb+VNA3SPAJ6Hwmr2LMxw1c1KpolzM7w2Spoq9YAKNpp8qO14rM0VgzdzkO/ARGz5jQz4
	We60SQih+U2dO+bdRn8HOFgoAo+zll+SObG9gKUmkVBd+U0lO6e7Sy122UuJ0mqxfca29Sur2Ma
	ZLBpzpDjEcjIlGgAOFH2oRG3IEIyasOuV5YtANUuKr+dyhrAuTDiUz9huvzWL/83mDEL/s8fazU
	+dUMyyL0hUHoSWhmjHNUksJdsXNwoo+JWJ1zn/A0I2R6UawMH3bhNuDrxaC5D6uujvbGIOEY0pJ
	gSk+gedexN+w==
X-Received: by 2002:a05:7301:dd88:b0:382:76f1:5d75 with SMTP id 5a478bee46e88-38280c30ea2mr1732278eec.8.1794983796768;
        Tue, 17 Nov 2026 22:36:36 -0800 (PST)
X-Received: by 2002:a05:7301:dd88:b0:382:76f1:5d75 with SMTP id 5a478bee46e88-38280c30ea2mr1732258eec.8.1794983796117;
        Tue, 17 Nov 2026 22:36:36 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:35 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 09/19] wifi: nl80211: add NDP offload capability advertisement
Date: Wed, 18 Nov 2026 12:05:44 +0530
Message-Id: <20261118063554.2260397-10-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd4775 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PZigtcPV9FlgwVnooq0A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: BY7l73pmi67RSnFjVecTRF2g-yJpgyh9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfXzLiIaq/6jU9C
 f6/AxJtqJ32O5Hqai7mCiso757MwWM2TmsIqQEXgiQUbuYP/y3UQ4zvq/1wUwfHnBArhRHchozF
 O7rLlbos3V3Y2wGx8VgjCAtdAmQNk72Vv0P+olV0WUwvoyFcWPuBjYR1kw/GMwPqDqGlxnVZOTx
 reem/BBG35XDL+iSyhXe4rkzWQDLjZ6NcV0AHwxzMxyuWpKZDmwM1Dfv/9Ad72r8C7Eaell7lf6
 jKeU4bcOSw2HtKOdlhLTCeQa4bZsQb86haO1fLd8XXvloKJmLb19rSzAqhXKX/VaiYLL55zgUcC
 lE2fXEySwn7c1nmKclYQ5dCRPc/B2eT4OmOgdb2g1aSDhchcNZnTmSYF7UZc88hL7b+VdqmaXh4
 i6ItaWJSZ20a92zGHh5fqFSjF+VfOArF9BXTTepB87Mr8ZWHCjrD1ON04D4l+rtzJTN4p7by2Tb
 ic8J3MOn7NalzaNIeZA==
X-Proofpoint-ORIG-GUID: BY7l73pmi67RSnFjVecTRF2g-yJpgyh9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfXz9g5Lk5AOG6z
 NZ1aHZQ604dwXu1ViR9BrFGdMYM06/VRbWOctCqqTMiWoyHZe4N7qdapcaYMkkAei4wNNrr4CbD
 lOQ7Hs8hO/vKTd+D6Z3YEWtVOhkJgzU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

Advertise whether a device performs the complete NAN Data Path setup and
teardown handshake with its peer, including security negotiation. The
device assigns NDP IDs for locally initiated sessions, manages NDI peer
stations, and derives, installs, and removes PTKs and, when requested,
the GTK.

An offloaded device negotiates NDLs for its NDPs within the local NAN
schedule configured by userspace. This includes NDC and immutable
schedules and their updates, while honoring per-NDP QoS requirements.
Userspace continues to configure the local schedule and non-evacuable
channels. The device manages peer schedules, so reject only
NL80211_CMD_NAN_SET_PEER_SCHED for devices with this capability.

Expose the capability through the NAN capabilities response so userspace
can determine whether the device supports the NAN NDP commands and
notifications. Secure NDPs additionally require SECURE_NAN.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 36 +++++++++++++++++++++++++++++--
 include/uapi/linux/nl80211.h | 41 +++++++++++++++++++++++++++++++++---
 net/wireless/nl80211.c       | 10 +++++++++
 3 files changed, 82 insertions(+), 5 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 9acb657a824e..b1289d5fcd93 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -5354,7 +5354,8 @@ struct mgmt_frame_regs {
  *	in which each entry maps each time slot to the channel on which the
  *	radio should operate on. If the chandef of a NAN channel is not
  *	changed, the channel entry must also remain unchanged. It is the
- *	driver's responsibility to verify this.
+ *	driver's responsibility to verify this. For offloaded NDPs, the device
+ *	negotiates each NDL within this user-configured local schedule.
  * @nan_set_peer_sched: configure the peer schedule for NAN. The schedule
  *	consists of an array of %cfg80211_nan_channel and the schedule itself,
  *	in which each entry maps each time slot to a channel on which the
@@ -5362,12 +5363,16 @@ struct mgmt_frame_regs {
  *	information such as committed DW, etc. When updating an existing peer
  *	schedule, the full new schedule is provided - partial updates are not
  *	supported, and the new schedule completely replaces the previous one.
+ *	Not supported when %WIPHY_NAN_FLAGS_OFFLOAD_NDP is set; the device learns
+ *	and manages peer schedules for offloaded NDPs.
  *
  * @nan_set_non_evac_channels: set the list of local schedule channels that
  *	must not be evacuated for concurrent operations. The provided list
  *	replaces the previous set; channels of the current schedule that are
  *	not included become evacuable again. All provided channels are
- *	guaranteed by cfg80211 to belong to the current local schedule.
+ *	guaranteed by cfg80211 to belong to the current local schedule. For
+ *	offloaded NDPs, userspace configures these channels for the device to
+ *	consider while negotiating NDL schedules.
  *
  * @set_multicast_to_unicast: configure multicast to unicast conversion for BSS
  *
@@ -6485,12 +6490,39 @@ struct wiphy_radio {
  * @WIPHY_NAN_FLAGS_OFFLOAD_RANGING: Firmware supports fully offloaded NAN
  *	ranging procedure, including ranging session setup, update, and
  *	termination, FTM protocol and procedure, and ranging report.
+ * @WIPHY_NAN_FLAGS_OFFLOAD_NDP: Device offloads the complete NDP setup and
+ *	teardown handshake with its peer, including NDP Request/Response/Confirm
+ *	and security handshakes. Within the local NAN schedule configured by
+ *	userspace, the device negotiates NDLs for offloaded NDPs, including NDC,
+ *	immutable schedules, and schedule updates, honoring NDP QoS requirements.
+ *	Userspace continues to configure the local schedule with
+ *	%NL80211_CMD_NAN_SET_LOCAL_SCHED and its non-evacuable channels with
+ *	%NL80211_CMD_NAN_SET_NON_EVAC_CHANNELS. The device learns and manages peer
+ *	NAN schedules; userspace must not set them with
+ *	%NL80211_CMD_NAN_SET_PEER_SCHED. The device assigns NDP IDs for locally
+ *	initiated NDPs, derives, installs, and removes PTKs and, when requested,
+ *	GTKs. The device creates and removes NDI peer stations for offloaded NDPs.
+ *	Userspace must not add those NDI peer stations or their
+ *	keys. NDP offload is supported on all bands in
+ *	&struct wiphy.nan_supported_bands. The device supplies the band-specific
+ *	capabilities, such as the HE 6 GHz band and EHT capabilities, and the
+ *	regulatory information in the frames it builds. The driver implements
+ *	@nan_ndp_initiate,
+ *	@nan_ndp_respond, and
+ *	@nan_ndp_terminate callbacks. It supports
+ *	%NL80211_CMD_NAN_NDP_INITIATE, %NL80211_CMD_NAN_NDP_RESPOND, and
+ *	%NL80211_CMD_NAN_NDP_TERMINATE, and
+ *	reports peer requests, setup status, and termination with
+ *	cfg80211_nan_ndp_request(), cfg80211_nan_ndp_status(), and
+ *	cfg80211_nan_ndp_terminated(). Secure NDPs require
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
  */
 enum wiphy_nan_flags {
 	WIPHY_NAN_FLAGS_CONFIGURABLE_SYNC = BIT(0),
 	WIPHY_NAN_FLAGS_USERSPACE_DE   = BIT(1),
 	WIPHY_NAN_FLAGS_INSTANT_COMM = BIT(2),
 	WIPHY_NAN_FLAGS_OFFLOAD_RANGING = BIT(3),
+	WIPHY_NAN_FLAGS_OFFLOAD_NDP = BIT(4),
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 23d19a6e8d81..f22ad0a018a7 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -455,7 +455,9 @@
  *	%NL80211_ATTR_KEY_IDX, %NL80211_ATTR_MAC, %NL80211_ATTR_KEY_CIPHER,
  *	and %NL80211_ATTR_KEY_SEQ attributes. %NL80211_ATTR_MAC represents
  *	peer's MLD address for MLO pairwise key. The link to add MLO
- *	group key is identified by %NL80211_ATTR_MLO_LINK_ID.
+ *	group key is identified by %NL80211_ATTR_MLO_LINK_ID. For an NDI peer
+ *	station participating in an offloaded NDP, userspace must not add keys;
+ *	the device manages the NDP keys.
  * @NL80211_CMD_DEL_KEY: delete a key identified by %NL80211_ATTR_KEY_IDX
  *	or %NL80211_ATTR_MAC. %NL80211_ATTR_MAC represents peer's MLD address
  *	for MLO pairwise key. The link to delete group key is identified by
@@ -488,7 +490,9 @@
  * @NL80211_CMD_SET_STATION: Set station attributes for station identified by
  *	%NL80211_ATTR_MAC on the interface identified by %NL80211_ATTR_IFINDEX.
  * @NL80211_CMD_NEW_STATION: Add a station with given attributes to the
- *	interface identified by %NL80211_ATTR_IFINDEX.
+ *	interface identified by %NL80211_ATTR_IFINDEX. For an offloaded NDP,
+ *	the device creates and removes the NDI peer station; userspace must not
+ *	add a duplicate station.
  * @NL80211_CMD_DEL_STATION: Remove a station identified by %NL80211_ATTR_MAC
  *	or, if no MAC address given, all stations, on the interface identified
  *	by %NL80211_ATTR_IFINDEX. For MLD station, MLD address is used in
@@ -1454,6 +1458,8 @@
  *	channels that remain in the new schedule keep their marking, channels
  *	that are removed simply lose it, and newly added channels are
  *	evacuable by default.
+ *	For offloaded NDPs, the device negotiates NDL schedules within this
+ *	user-configured local schedule.
  * @NL80211_CMD_NAN_SCHED_UPDATE_DONE: Event sent to user space to notify that
  *	a deferred local NAN schedule update (requested with
  *	%NL80211_CMD_NAN_SET_LOCAL_SCHED and %NL80211_ATTR_NAN_SCHED_DEFERRED)
@@ -1461,6 +1467,8 @@
  *	indicates that the update was successful.
  * @NL80211_CMD_NAN_SET_PEER_SCHED: Set the peer NAN schedule. NAN
  *	must be operational (%NL80211_CMD_START_NAN was executed).
+ *	Not supported when %NL80211_NAN_CAPA_OFFLOAD_NDP is advertised; the
+ *	device learns and manages peer schedules for offloaded NDPs.
  *	Required attributes: %NL80211_ATTR_MAC (peer NMI address) and
  *	%NL80211_ATTR_NAN_COMMITTED_DW.
  *	Optionally, the full schedule can be provided by including all of:
@@ -1522,6 +1530,8 @@
  *	keep their non-evacuable marking, removed channels lose it, and newly
  *	added channels are evacuable by default; issue this command again to
  *	change the non-evacuable set.
+ *	For offloaded NDPs, userspace configures non-evacuable channels for the
+ *	device to consider while negotiating NDL schedules.
  * @NL80211_CMD_UPDATE_BEACON: Update the beacon and other templates of an AP
  *	interface, but only that. Same attributes as %NL80211_CMD_SET_BEACON,
  *	%NL80211_ATTR_BEACON_HEAD and %NL80211_ATTR_BEACON_TAIL are required,
@@ -3272,7 +3282,8 @@ enum nl80211_commands {
  *	the update failed.
  * @NL80211_ATTR_NAN_NMI_MAC: The address of the NMI station to which this NDI
  *	station belongs. Used with %NL80211_CMD_NEW_STATION when adding an NDI
- *	station.
+ *	station. With %NL80211_NAN_CAPA_OFFLOAD_NDP, the device creates and removes
+ *	NDI peer stations for offloaded NDPs; userspace must not add duplicates.
  * @NL80211_ATTR_NAN_ULW: (Binary) The initial ULW(s) as published by the
  *	peer, as defined in the Wi-Fi Aware (TM) 4.0 specification Table 109
  *	(Unaligned Schedule attribute format). Used to configure the device
@@ -9346,6 +9357,29 @@ enum nl80211_s1g_short_beacon_attrs {
  * @NL80211_NAN_CAPA_OFFLOAD_RANGING: flag attribute. Firmware supports the
  *	fully offloaded NAN ranging procedure, including ranging session setup,
  *	update, and termination, FTM protocol and procedure, and ranging reports.
+ * @NL80211_NAN_CAPA_OFFLOAD_NDP: flag attribute. The device performs the
+ *	complete NAN Data Path setup and teardown handshake with the peer,
+ *	including NDP Request/Response/Confirm and the security handshake. Within
+ *	the local NAN schedule configured by userspace, the device negotiates NDLs
+ *	for offloaded NDPs, including NDC, immutable schedules, and schedule
+ *	updates, honoring NDP QoS requirements. Userspace continues to configure
+ *	the local schedule with %NL80211_CMD_NAN_SET_LOCAL_SCHED and its
+ *	non-evacuable channels with %NL80211_CMD_NAN_SET_NON_EVAC_CHANNELS. The
+ *	device learns and manages peer NAN schedules; userspace must not set them
+ *	with %NL80211_CMD_NAN_SET_PEER_SCHED. The device assigns NDP IDs for
+ *	locally initiated NDPs and derives, installs, and removes data path keys
+ *	(PTK and, when requested, GTK). The device creates and removes NDI peer
+ *	stations for offloaded NDPs. Userspace must not add those NDI peer stations
+ *	or their keys. NDP offload is supported on every band that the device
+ *	reports for NAN in %NL80211_ATTR_BANDS. The device supplies the band-specific
+ *	capabilities, such as the HE 6 GHz band and EHT capabilities, and the
+ *	regulatory information in the frames it builds. The device supports
+ *	%NL80211_CMD_NAN_NDP_INITIATE,
+ *	%NL80211_CMD_NAN_NDP_RESPOND, and
+ *	%NL80211_CMD_NAN_NDP_TERMINATE, and reports peer requests, setup status,
+ *	and termination with %NL80211_CMD_NAN_NDP_INITIATE,
+ *	%NL80211_CMD_NAN_NDP_STATUS, and %NL80211_CMD_NAN_NDP_TERMINATE.
+ *	Secure NDPs additionally require %NL80211_EXT_FEATURE_SECURE_NAN.
  * @__NL80211_NAN_CAPABILITIES_LAST: Internal
  * @NL80211_NAN_CAPABILITIES_MAX: Highest NAN capability attribute.
  */
@@ -9361,6 +9395,7 @@ enum nl80211_nan_capabilities {
 	NL80211_NAN_CAPA_PHY,
 	NL80211_NAN_CAPA_INSTANT_COMM,
 	NL80211_NAN_CAPA_OFFLOAD_RANGING,
+	NL80211_NAN_CAPA_OFFLOAD_NDP,
 	/* keep last */
 	__NL80211_NAN_CAPABILITIES_LAST,
 	NL80211_NAN_CAPABILITIES_MAX = __NL80211_NAN_CAPABILITIES_LAST - 1,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 8d4e98fcedab..7426d2c8a40b 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -3223,6 +3223,10 @@ static int nl80211_put_nan_capa(struct wiphy *wiphy, struct sk_buff *msg)
 	    nla_put_flag(msg, NL80211_NAN_CAPA_OFFLOAD_RANGING))
 		goto fail;
 
+	if ((wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_OFFLOAD_NDP) &&
+	    nla_put_flag(msg, NL80211_NAN_CAPA_OFFLOAD_NDP))
+		goto fail;
+
 	if (nla_put_u8(msg, NL80211_NAN_CAPA_OP_MODE,
 		       wiphy->nan_capa.op_mode) ||
 	    nla_put_u8(msg, NL80211_NAN_CAPA_NUM_ANTENNAS,
@@ -18359,6 +18363,12 @@ static int nl80211_nan_set_peer_sched(struct sk_buff *skb,
 	if (wdev->iftype != NL80211_IFTYPE_NAN)
 		return -EOPNOTSUPP;
 
+	if (rdev->wiphy.nan_capa.flags & WIPHY_NAN_FLAGS_OFFLOAD_NDP) {
+		NL_SET_ERR_MSG(info->extack,
+			       "Peer NAN schedule is managed by the device with NDP offload");
+		return -EOPNOTSUPP;
+	}
+
 	if (!info->attrs[NL80211_ATTR_MAC] ||
 	    !info->attrs[NL80211_ATTR_NAN_COMMITTED_DW]) {
 		NL_SET_ERR_MSG(info->extack,
-- 
2.34.1

