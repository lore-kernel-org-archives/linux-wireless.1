Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565416;
	b=mADjz5uy4Ix1cvFWmQJpqp6CPx/9zYnZg0XL0qnFxC/xpQmMEgXRHIgpp7TsngS5QvSt
	 MKjMDSYnxt3mwHCeydFW8MdH3Gol2OXLZvVfmthdaldT2hktIOJhWFd2TsYG9lisMqTFo
	 80g13rsroGhCsqS+qEQlxo8ai+7YDWUWHCuPQ/EiHpquBH4R6DLRINUw28kdiqZcBAby5
	 49OEtsmKttsm6j9X7AuTly/cPxybGj29Fa6snaqs4gAF8GCAv6BGOxR/rUgQP9rYJZg6H
	 AJBQ1GivyULR2XlQ2n40h2tHwEvGTjXhU85QarmaH3Lkltob92UHDC2RKK6id8m6S7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565416;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oG2zaDt67J/7J7BrLV1Z2b0vMZ3Dt8+Opwk8h4XGIrw=;
	b=zCWNANYO+hV/Nu9FwGwqcogJ1WFPh2OYSR2kePDwIi1p1A5CUtSPbHNwws9FFJbM3p/W
	 r1v5k/F+06ELOZHotZMJAO1dTrRTB8ibFg3OP5CZSpeZAWwiy3gAAlMn7ZdzT5qkC0Raq
	 PwhdSfBUKrNSHxYAvwVM+p9W4eVHChu+x8eHLZs6zwONi63RkzXv7KLbnDph7i0ZxrNlE
	 fJNqm6ZfusKf5yZY6JvVvrWC+cyMve+/29eXCdRK5yW9unY3WoUikrOUsO1DTMNuCqT0b
	 TgKSHWiC1wHUpz/M01PXhizUTGwMCXVbkYrfV8200uUbq72/KAUhdpTlr5mcpN+MoHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQNyWRSw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V2wQAufE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9831C606A8A9
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9831C606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQNyWRSw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V2wQAufE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VKb22515666
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oG2zaDt67J/
	7J7BrLV1Z2b0vMZ3Dt8+Opwk8h4XGIrw=; b=CQNyWRSwHA0orkCbiver9x7OoNW
	u810mQtO57LpBEjTB0SmODEE2oUrE1W5bDf1p2pWAM0ABpc7uNr7LVEOoYQHpJal
	O3pulXKsr+9SU2xWr7PqW7emIYkI4sfK8ABRKY4JzEoK+HzU4udEJ31lW6zNNeYC
	UD6El5dccOxCtqXjgthZONx/okCrMO/vBeKzoz47NUsQVrfRunwqd7ecpjd+TZm2
	hgczyUzcwZL89pnC4xWvsz4ihm1lRiML8/gZPPIxEfGZJSe3W4IpfYOf1Aj8F2Vh
	AJUsci8hq2QxQjN+wvx4jPXxjO0M8eUaiXM8Nq68hyv9sNWRTqeUoXmgcGg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bbkpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so1147043eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565414; x=1795170214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oG2zaDt67J/7J7BrLV1Z2b0vMZ3Dt8+Opwk8h4XGIrw=;
        b=V2wQAufE2LSMr58Yel77AchJ80ArZZMiDs4VDSuaGWZXLf05ur0R8c7YRe3u06LKY4
         cEkJyetT5el2U/bQGMDqyE2vZ/P7qw37pq6Hf2xI2dp3HGSrxXXQxCY72rPYPDI+m5EO
         7Yv7KNWU2DVXVEPX6fY4lfMNLy+bC8wpHrMSxOeHNKwsU6oKMVBty/9ONIHAvNTVsuWP
         Ywrf+5Z8zJ0MfpLY10Gbhs7oziP0A/3XGDiUsxtk8OTyE5h0G/X9yJeX5PrvsYymi+Yy
         1tvyvgXyZX2Ot52rfxv+C386sqk61nFAB87pJf4pOzZINihN+u/jOvkMvA9+TsB5Rw5N
         Mbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565414; x=1795170214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oG2zaDt67J/7J7BrLV1Z2b0vMZ3Dt8+Opwk8h4XGIrw=;
        b=YqmjV5uYg2RQwXMO9/b1C/E255dsT6Cxq/mvWBROYjeFUMTCCBO6EM4fzSRhReQWqr
         Ik1Xa3iZ5xC130RlDtBaLihrcwhRaL1uzrGPg1zxSyNMCGYTRTR9yHkU9MrQq0haZJE3
         vDow/wghQxoXyo206j6rXu+7NiPzyZ/kf5F/eXNKbcYQWvRMIxA8uohSk5hiu8ZqMhLg
         sSX/wYJaPkQegMoKKq5CnKm284bbGoy5rsOyPVYhuLMJoueqQPFevmEc1r3wZnFNySPH
         JQqHZCicNtbt7Mh6VjKDMBTWo7Xf1nooSCb34ZmNXSdUBh46ISb+Y1VQvsMB5egDuTkK
         CYFA==
X-Gm-Message-State: APuU4Z/gUiNJks69nEaWGvjwYf5bhAQhTUGkUVNYCtpaLebwcnIcTopC
	tpDv4CSNe+wCmb18OzZB9qX9fLsKomT5zE1uvNWsUWMPrqaXJjar9P2YnXVLbrY51meKJdwgHj/
	fHc+uhcIQ0Lq1pu8OITv2DGMtP4cT6l8WhRUxZ8bbMAq2gnv+TyUtY81Cqw4DvM2g1RlCRA==
X-Gm-Gg: AYBFou1HgPX0GGjmaIdxts7vPOuypijScwQtzwkXZ+Ty9AmeMAPZVE9j/6eTAG0xGEM
	T3vXEeYzDhzQYYex+dWxqEezx0qmrNkWfPHR2MyCcRZtJQZoUu7TP8B/3OXBQhg+9dodlJQPr/z
	yguBDAIdKOMWa8KUMniJEKLYkTE54JQsJQDH/2r527QlvXWmKFsfex6mkrAbMOiJhvbqIb4AtLn
	IZwl2Aj5zPTBLa1EGeaM64xWc+98F0Fu5huwM6OIaj/F5LXWrCPeCAP4r8+5+3j5SPUcSgJSn4X
	TnYB7SNICSjWV+/wbAL2wixtkzN4JR5UgfOadi9L5MAY1jzsKAoPeNeNag2IIgY/PnjOnobk15E
	PW6a2oM9JSffclkaq0logv1wS9udDn7Hlf4VmCs1R/NI55dx7SWN87a4zVcofDro/v3KTK28nEx
	XjXhamJiVbONE=
X-Received: by 2002:a05:7301:619a:10b0:36e:d060:8bad with SMTP id 5a478bee46e88-379633739e4mr1736837eec.5.1794565413900;
        Fri, 13 Nov 2026 02:23:33 -0800 (PST)
X-Received: by 2002:a05:7301:619a:10b0:36e:d060:8bad with SMTP id 5a478bee46e88-379633739e4mr1736780eec.5.1794565412496;
        Fri, 13 Nov 2026 02:23:32 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:32 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 17/19] wifi: nl80211/cfg80211: allow extra NAN attributes in offloaded functions
Date: Fri, 13 Nov 2026 15:52:26 +0530
Message-Id: <20261113102228.1917973-18-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6e526 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=-RX98rD8DKRKJ5uf4OcA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: rZb7535R4yTrlasOxdmkYqXkC2Hzk_Nc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX3eXSqGK/Zmut
 3SGrw2sl5s0Dy4JXPtWzB8xJT61X/VTmsC6+aTU9oH9OwtA9YcvoqRl6ebsdgAGQjgG8pwfuugJ
 nJy+hza2W+T6NejMX9HBhztjWXYcoKfJYg9VsnucHTe6o6F2As1qeVlkDopop1KpT7AYwJGu9C7
 juAhTV1zHVCt0vh1tp5MaLh6SxXQHXp9XUQ1wzSd9I60+2bgtzjlg2qXw3h7gxMppCcSD0izC5Z
 vz6+4IBnloFzdn/BN+Vev3lwz76PckqNVGsKPqQrVWvJM5avFI9IeLRhVwCPAcgrlLxvp72GTRi
 /MzQ5/yT1rQpM78k/tDso65x/GMBC3r4edyc3wWqrYb1ksstfjcyvPBSQ5tucBle2t1oiM/gECF
 iHAIZBk0JHojOiZy3iVpzOS+yjYntwjLNeKijMLmJQxbf6D7i1lXtwvxvZIsCg4BIpAyzuN+lM4
 ZE2Ehe6N/1jWcMraoTA==
X-Proofpoint-ORIG-GUID: rZb7535R4yTrlasOxdmkYqXkC2Hzk_Nc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX83DnYf4BQD70
 3/EaSlbxelgEEc/Nc0LRLstddrCvL4b4suosALRMtj+MElXEV/FZrsRAqgG41ZwprqdvdgZAhIG
 LuZKDMvQjoIZ+KROc8BYFfPbjxq3SrU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

From: Vinay Gannevaram <vganneva@qti.qualcomm.com>

With an offloaded NAN Discovery Engine the device builds and transmits
the Service Discovery Frames, so everything that goes into them has to
be expressed with function attributes. NAN pairing, however, can be
handled in user space: the PASN Authentication frames, the bootstrapping
frames and the Follow-up messages with the Shared Key Descriptor
attribute are built by user space and sent with NL80211_CMD_FRAME. For
pairing verification, the NAN Identity Resolution attribute, which user
space derives from its NAN Identity Key, must also be included in the
Publish and Subscribe messages that the device transmits in the
discovery windows.

Add NL80211_NAN_FUNC_EXTRA_ATTRS to pass a list of complete NAN
attributes that the device appends to the frames of the function. This
keeps pairing, and the NAN Identity Key, in user space.

Validate the attribute framing, bound the length like information
elements, and only accept the attribute if the driver advertises
NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS.

Signed-off-by: Vinay Gannevaram <vganneva@qti.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 14 ++++++++
 include/uapi/linux/nl80211.h | 15 +++++++++
 net/wireless/core.c          |  4 +++
 net/wireless/nl80211.c       | 63 ++++++++++++++++++++++++++++++++++++
 net/wireless/trace.h         |  9 ++++--
 net/wireless/util.c          |  1 +
 6 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index e44c5da96ece..0964301473e1 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4690,6 +4690,14 @@ struct cfg80211_nan_func_filter {
  * @chandef: channel definition for FTM ranging.
  * @range_report: if true, a NAN Ranging Report is required after the FTM
  *	session.
+ * @extra_attrs: additional NAN attributes to append to the Service Discovery
+ *	Frames transmitted for this function. It must not contain attributes that
+ *	the device adds itself, such as the Service Descriptor attribute or
+ *	attributes derived from other function fields. Typical uses include the
+ *	NAN Identity Resolution attribute for pairing verification in Publish and
+ *	Subscribe messages. The driver is responsible for ensuring the resulting
+ *	frame fits its supported limits.
+ * @extra_attrs_len: length of @extra_attrs.
  */
 struct cfg80211_nan_func {
 	enum nl80211_nan_function_type type;
@@ -4733,6 +4741,8 @@ struct cfg80211_nan_func {
 	bool chandef_valid;
 	struct cfg80211_chan_def chandef;
 	bool range_report;
+	const u8 *extra_attrs;
+	u16 extra_attrs_len;
 };
 
 /**
@@ -6787,6 +6797,9 @@ struct wiphy_radio {
  *	cfg80211_nan_ndp_request(), cfg80211_nan_ndp_status(), and
  *	cfg80211_nan_ndp_terminated(). Secure NDPs require
  *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS: Driver accepts additional per-function
+ *	NAN attributes when the Discovery Engine is offloaded. This flag cannot
+ *	be used with %WIPHY_NAN_FLAGS_USERSPACE_DE.
  */
 enum wiphy_nan_flags {
 	WIPHY_NAN_FLAGS_CONFIGURABLE_SYNC = BIT(0),
@@ -6794,6 +6807,7 @@ enum wiphy_nan_flags {
 	WIPHY_NAN_FLAGS_INSTANT_COMM = BIT(2),
 	WIPHY_NAN_FLAGS_OFFLOAD_RANGING = BIT(3),
 	WIPHY_NAN_FLAGS_OFFLOAD_NDP = BIT(4),
+	WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS = BIT(5),
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index e6172abab0d6..2581b7328867 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -7980,6 +7980,15 @@ enum nl80211_nan_func_term_reason {
  *	using top-level attributes like %NL80211_ATTR_WIPHY_FREQ etc.
  * @NL80211_NAN_FUNC_RANGE_REPORT: flag indicating that a NAN Ranging
  *	Report is required after the FTM session.
+ * @NL80211_NAN_FUNC_EXTRA_ATTRS: binary attribute containing additional NAN
+ *	attributes to append to Service Discovery Frames transmitted for this
+ *	function. Each attribute is encoded as a one-octet ID, a two-octet
+ *	little-endian length, and that many body octets. It must not contain
+ *	attributes that the device adds itself, such as the Service Descriptor
+ *	attribute or attributes derived from other function attributes. Typical
+ *	uses include the NAN Identity Resolution attribute for pairing
+ *	verification in Publish and Subscribe messages. Requires
+ *	%NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS.
  *
  * @NUM_NL80211_NAN_FUNC_ATTR: internal
  * @NL80211_NAN_FUNC_ATTR_MAX: highest NAN function attribute
@@ -8016,6 +8025,7 @@ enum nl80211_nan_func_attributes {
 	NL80211_NAN_FUNC_PREAMBLE,
 	NL80211_NAN_FUNC_CHAN,
 	NL80211_NAN_FUNC_RANGE_REPORT,
+	NL80211_NAN_FUNC_EXTRA_ATTRS,
 
 	/* keep last */
 	NUM_NL80211_NAN_FUNC_ATTR,
@@ -9564,6 +9574,10 @@ enum nl80211_s1g_short_beacon_attrs {
  *	and termination with %NL80211_CMD_NAN_NDP_INITIATE,
  *	%NL80211_CMD_NAN_NDP_STATUS, and %NL80211_CMD_NAN_NDP_TERMINATE.
  *	Secure NDPs additionally require %NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS: flag attribute. The device accepts
+ *	%NL80211_NAN_FUNC_EXTRA_ATTRS for NAN functions when the NAN Discovery
+ *	Engine is offloaded. This capability is not available when
+ *	%NL80211_NAN_CAPA_USERSPACE_DE is set.
  * @__NL80211_NAN_CAPABILITIES_LAST: Internal
  * @NL80211_NAN_CAPABILITIES_MAX: Highest NAN capability attribute.
  */
@@ -9580,6 +9594,7 @@ enum nl80211_nan_capabilities {
 	NL80211_NAN_CAPA_INSTANT_COMM,
 	NL80211_NAN_CAPA_OFFLOAD_RANGING,
 	NL80211_NAN_CAPA_OFFLOAD_NDP,
+	NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS,
 	/* keep last */
 	__NL80211_NAN_CAPABILITIES_LAST,
 	NL80211_NAN_CAPABILITIES_MAX = __NL80211_NAN_CAPABILITIES_LAST - 1,
diff --git a/net/wireless/core.c b/net/wireless/core.c
index 00e97ca901e2..1326786b058b 100644
--- a/net/wireless/core.c
+++ b/net/wireless/core.c
@@ -935,6 +935,10 @@ int wiphy_register(struct wiphy *wiphy)
 		     !rdev->ops->add_nan_func || !rdev->ops->del_nan_func ||
 		     !(wiphy->nan_supported_bands & BIT(NL80211_BAND_2GHZ)))))
 		return -EINVAL;
+	if (WARN_ON((wiphy->nan_capa.flags &
+		     WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS) &&
+		    (wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_USERSPACE_DE)))
+		return -EINVAL;
 
 	if (WARN_ON((wiphy->interface_modes & BIT(NL80211_IFTYPE_NAN_DATA)) &&
 		    (!wiphy->nan_capa.phy.ht.ht_supported || wiphy->n_radio > 1)))
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index c74386dc6e01..1856b9cd3f1c 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -479,6 +479,42 @@ static int validate_nan_pmk(const struct nlattr *attr,
 	return 0;
 }
 
+static int validate_nan_func_extra_attrs(const struct nlattr *attr,
+					 struct netlink_ext_ack *extack)
+{
+	const u8 *data = nla_data(attr);
+	unsigned int len = nla_len(attr);
+	unsigned int pos = 0;
+
+	if (!len) {
+		NL_SET_ERR_MSG_ATTR(extack, attr,
+				    "NAN function extra attributes must not be empty");
+		return -EINVAL;
+	}
+
+	while (pos < len) {
+		u16 attr_len;
+
+		if (len - pos < 3) {
+			NL_SET_ERR_MSG_ATTR(extack, attr,
+					    "NAN function extra attribute has a truncated header");
+			return -EINVAL;
+		}
+
+		attr_len = get_unaligned_le16(data + pos + 1);
+		pos += 3;
+		if (attr_len > len - pos) {
+			NL_SET_ERR_MSG_ATTR(extack, attr,
+					    "NAN function extra attribute length exceeds remaining data");
+			return -EINVAL;
+		}
+
+		pos += attr_len;
+	}
+
+	return 0;
+}
+
 static int validate_nan_avail_blob(const struct nlattr *attr,
 				   struct netlink_ext_ack *extack)
 {
@@ -1437,6 +1473,10 @@ nl80211_nan_func_policy[NL80211_NAN_FUNC_ATTR_MAX + 1] = {
 				 NL80211_PREAMBLE_HE),
 	[NL80211_NAN_FUNC_CHAN] = NLA_POLICY_NESTED(nl80211_policy),
 	[NL80211_NAN_FUNC_RANGE_REPORT] = { .type = NLA_FLAG },
+	[NL80211_NAN_FUNC_EXTRA_ATTRS] =
+		NLA_POLICY_VALIDATE_FN(NLA_BINARY,
+				       validate_nan_func_extra_attrs,
+				       IEEE80211_MAX_DATA_LEN),
 };
 
 /* policy for Service Response Filter attributes */
@@ -3258,6 +3298,10 @@ static int nl80211_put_nan_capa(struct wiphy *wiphy, struct sk_buff *msg)
 	    nla_put_flag(msg, NL80211_NAN_CAPA_OFFLOAD_NDP))
 		goto fail;
 
+	if ((wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS) &&
+	    nla_put_flag(msg, NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS))
+		goto fail;
+
 	if (nla_put_u8(msg, NL80211_NAN_CAPA_OP_MODE,
 		       wiphy->nan_capa.op_mode) ||
 	    nla_put_u8(msg, NL80211_NAN_CAPA_NUM_ANTENNAS,
@@ -17719,6 +17763,25 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 			goto out;
 	}
 
+	if (tb[NL80211_NAN_FUNC_EXTRA_ATTRS]) {
+		if (!(wdev->wiphy->nan_capa.flags &
+		      WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS)) {
+			NL_SET_ERR_MSG(info->extack,
+				       "Extra NAN function attributes are not supported");
+			err = -EOPNOTSUPP;
+			goto out;
+		}
+
+		func->extra_attrs_len = nla_len(tb[NL80211_NAN_FUNC_EXTRA_ATTRS]);
+		func->extra_attrs =
+			kmemdup(nla_data(tb[NL80211_NAN_FUNC_EXTRA_ATTRS]),
+				func->extra_attrs_len, GFP_KERNEL);
+		if (!func->extra_attrs) {
+			err = -ENOMEM;
+			goto out;
+		}
+	}
+
 	func->data_path_required =
 		nla_get_flag(tb[NL80211_NAN_FUNC_DATA_PATH_REQUIRED]);
 	func->security_required =
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 0b0bef1e8cb7..85eb81d0d87f 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -2448,16 +2448,19 @@ TRACE_EVENT(rdev_add_nan_func,
 		WDEV_ENTRY
 		__field(u8, func_type)
 		__field(u64, cookie)
+		__field(u16, extra_attrs_len)
 	),
 	TP_fast_assign(
 		WIPHY_ASSIGN;
 		WDEV_ASSIGN;
 		__entry->func_type = func->type;
-		__entry->cookie = func->cookie
+		__entry->cookie = func->cookie;
+		__entry->extra_attrs_len = func->extra_attrs_len;
 	),
-	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT ", type=%u, cookie=%llu",
+	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
+		  ", type=%u, cookie=%llu, extra_attrs_len=%u",
 		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->func_type,
-		  __entry->cookie)
+		  __entry->cookie, __entry->extra_attrs_len)
 );
 
 TRACE_EVENT(rdev_nan_update_publish,
diff --git a/net/wireless/util.c b/net/wireless/util.c
index 980b16c72d4f..4e1cbe50af1e 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -2876,6 +2876,7 @@ void cfg80211_free_nan_func(struct cfg80211_nan_func *f)
 		return;
 
 	kfree(f->serv_spec_info);
+	kfree(f->extra_attrs);
 	kfree(f->srf_bf);
 	kfree(f->srf_macs);
 	kfree(f->csids);
-- 
2.34.1

