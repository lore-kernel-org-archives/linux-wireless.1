Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285215;
	b=bWmNmdDl9wAlaQQNxlkKBT3a3rXFUWOXP01X5tEvhm+YlmrqDpc5QtKbM8OPMKBhwSzh
	 PbVO1XtpF9ag9rf24iO4DvouLESIPNqR3kCZrBjkH1pJYNdzEPYXPfRG/cNZl0SEGKAnx
	 AHhyPPZinLz2ovQpW4tITaVDPiGA741AYw3uTADlg/gNx+jhYpuCIihNqzd6yO2AR2ME/
	 iObOrXg4bncyqdIhb6BY/NHCqlF7SXvmCA5a1duPpLaHcg+by8pZTUy7uJryTF6xwk24F
	 gQ9fFXpRGHKquB9UbpcOlOmPItvDNXAnqPuGo/pxyZ/xDHa/VUIUObBo/zrgBBnVUXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GjxHw6X8Z0o74KGZhL6H2frS4R+NE98oFJCNWVIKdkM=;
	b=TJazriiMz7k+zENHDqbjA2AmCnju7mcdNUHQNvdHeI+sdtY+YeVRwInxh5pZgJOeDbIi
	 uvv5yBnmksljHiFsZauG/Wjnow3TV/iit7z9fEr+AMEN8THEfr5J9pvrbh0lyuhGKD9jj
	 f2RXQlSTlojLHzWSaT2p4FOFo6c6nvrJyIus/+bw6eAZQl4kWwEDVrfsGJMfpJQm71F/Q
	 wV4EfKpL6cvQT4LHCtbGJTNwIeNH0AbMeVWxwnE9CiOWkMf6bI7XTPRb/yYuEXFiaZtYR
	 s41uFFRP9Foc8NX+izjFi1ffvwArvnpPGZa9WmPLaTz7eYn4kA0cDksHV08kk07U9Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZVe1PUNp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eb618PG9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030C560A382C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 030C560A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZVe1PUNp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eb618PG9
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A1s02249121
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GjxHw6X8Z0o
	74KGZhL6H2frS4R+NE98oFJCNWVIKdkM=; b=ZVe1PUNpp1e+T6xIKf3/pBmK5Qy
	b+IiYimsb9Bc0f6jqsYGZ7fs8V8pEBtXjXwl9B3U2gsHk6l9ZjlcR1JZt2RFGLXg
	6ZA4SFk1DBScRlkARd/LVvDWqZ7Sj+r5UG5ZewIvfY6MhfUF2rEfgOYQv2Y0vJwT
	Z2UY4X/SBLnpuaey9F2fw09SnYZvepNjf2pgvA1KEQVpUYDb3/3lVyHeZdOWYEg8
	GxvT2n2H5jQyAO9/6/uBrLVXnYuAAWD7NrORnHJjMjy9FqJi+5mRDKT8J5atJTK1
	hXchC6VvkvCOYj4F8mLCyFvrauiATZMyT68tUcV3aXfgXqXEIO2M5XWAXOg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapbmrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso1231025eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285212; x=1794890012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjxHw6X8Z0o74KGZhL6H2frS4R+NE98oFJCNWVIKdkM=;
        b=Eb618PG9vu+Toxq/RQ7DXV+dQE4LNtNVXCQFjA33R9HvtjAk0TkuokMAs3CmtYJzCZ
         rK4FIeNkB1Dmti4BS70d1OXo6Bhla+NwRSCPRJ2qAXeqQVxhi6wXvG08HROWeCf9Llkz
         LlZcxAGjchleeMc9ZsM/lIh1Efe14ikCJUASuVbAMZveC4usJ/rcxGeZStBnyQLqcyfX
         af51pTYKqOX0pHUub2eSzBT3nAlBIoDfrf5GT5LOoAdHeoQJtkvg+mKappVl6i7GHDQU
         6DtT5XNwAG3/IIAHPOdT/mQhSzuPUKGltkEKtuHkWDuVyGB0FOttP5Cg/whlk5kwTTCG
         hQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285212; x=1794890012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GjxHw6X8Z0o74KGZhL6H2frS4R+NE98oFJCNWVIKdkM=;
        b=CHiqykhhw/ciAxUqda23ZgPXu10G3lXyFU744KU9l2prIIJe/glz0l0DUKNvHM9aUp
         jFk9TV51Ss8FnHLyJ8IcHDzme2HfFsXOAkhuQaxxlXNzN2gglmTO55IMicGtYXl01zL4
         nvHQRYR8WSkwQn4SgAavldKj9kUD5mokI8oaTaf4tPtJVspcNmCkgNq7mW2MxKHFNEoh
         +PHYT2YKhChD6lOGl1Yzj3zJx02Zb49UTakXHWHykfSqE/yrBJ/urMFC8zjVQ/Wg4Btx
         I9o+ygJadY0hBdx4pskCUXT1pGNZsntKkGC2BHF4cZeHrJ9YdN17RYiPrLLCcXmPOY4G
         p8eg==
X-Gm-Message-State: APuU4Z9ccBR3/TB+GvOhI+RricSqxFeFxbAmlmQ3auVBftcdqNImLce3
	fGe5Lj7dLqgHRZuIcRg6/JUtA+1vidQfNHkYDqTPRtN2H7kFeme/EMEFlwkZkgAAh/4i4l/T7Lc
	8M1NzXzwmSNO/qFMF+2fUfC/OckeSLUA8DhWzWHqsBEqr0JgbTjoi2z1tkZnDNnitkabGAT0hhq
	F1xA==
X-Gm-Gg: AYBFou0ZqFaarvnXeoRcR5X6M62JmgoP78I6ICyag01Y7KwHpwdgT/c/tZefiRTIHm+
	9SrctyMjPDAMS8pLEbrakdln92YK3XwzgN/Vg1pGhkZuBX+g7/UD5KHK/1UL3tv8oPvrfEo8os5
	WxYsXt1FZoL7O4RIpOOHYcvu5IufUDTZu/DUk753I5kOHSJ+ukIQiGimSFB4W7DLQAt7AK2vtci
	eQrGo0I0uIeuASK9+rOMgQPR5YOzVI4IgCulDUQINBtaRMxQ/+M90mTkbM1AM6POopzzECLsFBT
	yG0oCJiRv5TBz1zTCE+4VjUpTO/EMfJHAg8TMGH6HZAE+vl6h2lk1eOFDDtdYNsdwTkcCLEYJSl
	aMamfbHxtkPwM2fRlYS2aYabITwkwROKIq/cq2dxx/4oam4bpcamY9xr0BBImdb0v6pOXMiWMc9
	PMIKgZgVkcmA==
X-Received: by 2002:a05:693c:88cf:10b0:369:fc93:eda5 with SMTP id 5a478bee46e88-3752021a1d1mr1976325eec.39.1794285212206;
        Mon, 09 Nov 2026 20:33:32 -0800 (PST)
X-Received: by 2002:a05:693c:88cf:10b0:369:fc93:eda5 with SMTP id 5a478bee46e88-3752021a1d1mr1976263eec.39.1794285211227;
        Mon, 09 Nov 2026 20:33:31 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:30 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 14/19] wifi: nl80211/cfg80211: add support for NDP status indication
Date: Tue, 10 Nov 2026 10:02:37 +0530
Message-Id: <20261110043242.2012238-15-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfXxpXZ/rl8l6Av
 +FnihNRFCNpL461aDa1FbCfOZ7nDEOApFbAT7lLMBu65kN7ZXzNogX3d4PJ3yx/85O5fFUOssVJ
 IpMDLp6du8D4Td118gANmzlK6FPb7AJpfse44k7V6szQRF6JH58/cVHj8LmoQD4Qy+1CL2aHO9w
 fVX7h5UxPdgwGuH68+pqMuilwCnIkWs3N2wm7Se2YgBPQDdgQAnP7Sj/vbtoOV9neIKlL2ekrKu
 rrfy3uNqrJzw6ZAtsyEcaIIRO4i+m/CFZZ909YnSxm41FqWLjS/jWKVTsjLSFMuMXnp5lqbVg8/
 sk6UD8Tg9VCKDGtKFv3yiIKqwXU7UrvuvLaDruCKnPmmuuE++SoeKSiO1j5XBIFew7Icew2qyVN
 lKfjJxXNKJSbwHbXfEIR3qHl3gOSXmGyzxhMhEQl/0UbmSQF9T0FO5SDtHOaTcg19z050qiCrHG
 zF19/U0dtllAeTKP88w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX8fTqZ1gsbMlE
 leb0kSEDpoeCxkgkxMKv/f+Lo/T2WIh133oJcTEyuNzSeUZO5m1ybdzOKjp7DvRXarJT2uHvzj4
 S+LSoOnrKyN7QuPiMWpmn5lmY6Ay0dA=
X-Proofpoint-ORIG-GUID: xXqfcgzVUbzTA34_mFzTPVpQ1FV9DEUI
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af29e9d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KIs_r_sxcAyzomjtXGYA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: xXqfcgzVUbzTA34_mFzTPVpQ1FV9DEUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100017

Add NL80211_CMD_NAN_NDP_STATUS to notify both NDP peers when setup
finishes. Use the ACCEPT flag to indicate successful setup and include
the responder NDI on success; report the rejection or failure reason
otherwise.

Add cfg80211_nan_ndp_status() and its parameter structure, validate the
notification parameters, trace the status without key material, and
deliver it to the NAN owner or multicast group. Include the transport
port and protocol received from the peer when present.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 53 +++++++++++++++++++++++
 include/uapi/linux/nl80211.h | 26 +++++++++---
 net/wireless/nl80211.c       | 81 ++++++++++++++++++++++++++++++++++++
 net/wireless/trace.h         | 73 ++++++++++++++++++++++++++++++++
 4 files changed, 228 insertions(+), 5 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index f208db3541f8..c0846bff31be 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4498,6 +4498,43 @@ struct cfg80211_nan_ndp_request_params {
 	u8 transport_protocol;
 };
 
+/**
+ * struct cfg80211_nan_ndp_status_params - NAN NDP status event parameters
+ *
+ * Sent exactly once to userspace for each NDP setup attempt, after the driver
+ * completes setup successfully, fails it, or times it out. This covers both
+ * locally initiated NDPs and peer requests reported to userspace.
+ *
+ * @peer_nmi: peer NMI address
+ * @ndp_id: NDP ID
+ * @init_ndi: initiator NDI MAC address
+ * @resp_ndi: responder NDI MAC address (valid when @accepted is true)
+ * @accepted: if true, NDP setup succeeded; if false, setup failed
+ * @reason: Wi-Fi Aware reason code for failure (valid when @accepted is false)
+ * @ssi: response service-specific info (may be NULL)
+ * @ssi_len: length of @ssi
+ * @ipv6_intf_id: peer's IPv6 link-local interface identifier, or NULL if absent
+ * @transport_info: if true, the peer included transport information
+ * @transport_port: transport port received from the peer when
+ *	@transport_info is true
+ * @transport_protocol: IANA protocol number received from the peer when
+ *	@transport_info is true
+ */
+struct cfg80211_nan_ndp_status_params {
+	const u8 *peer_nmi;
+	u8 ndp_id;
+	const u8 *init_ndi;
+	const u8 *resp_ndi;
+	bool accepted;
+	u8 reason;
+	const u8 *ssi;
+	u8 ssi_len;
+	const u8 *ipv6_intf_id;
+	bool transport_info;
+	u16 transport_port;
+	u8 transport_protocol;
+};
+
 /**
  * enum cfg80211_nan_conf_changes - indicates changed fields in NAN
  * configuration
@@ -11410,6 +11447,22 @@ void cfg80211_nan_ndp_request(struct wireless_dev *wdev,
 			      const struct cfg80211_nan_ndp_request_params *params,
 			      gfp_t gfp);
 
+/**
+ * cfg80211_nan_ndp_status - notify userspace that NDP setup is complete
+ * @wdev: the wireless device reporting the event
+ * @params: NDP status parameters
+ * @gfp: allocation flags
+ *
+ * Notify userspace that NAN Data Path setup is complete. Includes the
+ * setup status and, if successful, the responder NDI. Call exactly once for
+ * every locally initiated setup attempt and every indicated peer request,
+ * including failure and timeout (for example, when the peer does not respond).
+ * Only valid when %WIPHY_NAN_FLAGS_OFFLOAD_NDP is set.
+ */
+void cfg80211_nan_ndp_status(struct wireless_dev *wdev,
+			     const struct cfg80211_nan_ndp_status_params *params,
+			     gfp_t gfp);
+
 /**
  * cfg80211_incumbent_signal_notify - Notify userspace of incumbent signal detection
  * @wiphy: the wiphy to use
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index ee5ec11267a3..c7b61fa16943 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1524,6 +1524,17 @@
  *	and optionally %NL80211_NAN_NDP_ATTR_REASON.
  *	The command reply acknowledges the request; teardown completion is
  *	reported asynchronously by the termination notification.
+ * @NL80211_CMD_NAN_NDP_STATUS: Notification-only event sent to userspace on
+ *	the initiator and responder sides when NDP setup finishes, successfully or
+ *	not. If %NL80211_NAN_NDP_ATTR_ACCEPT is present, setup succeeded and
+ *	%NL80211_NAN_NDP_ATTR_RESP_NDI is present; otherwise the notification
+ *	carries %NL80211_NAN_NDP_ATTR_REASON. Also carries %NL80211_ATTR_MAC and
+ *	%NL80211_ATTR_NAN_NDP. Exactly one status notification is sent for each
+ *	setup attempt, whether initiated locally or from an indicated peer request.
+ *	It is sent after success, failure, or timeout, including when the peer does
+ *	not respond.
+ *	%NL80211_ATTR_NAN_NDP, including transport information when it was
+ *	included by the peer.
  *
  * @NL80211_CMD_MAX: highest used command number
  * @__NL80211_CMD_AFTER_LAST: internal use
@@ -1810,6 +1821,7 @@ enum nl80211_commands {
 	NL80211_CMD_NAN_NDP_INITIATE,
 	NL80211_CMD_NAN_NDP_RESPOND,
 	NL80211_CMD_NAN_NDP_TERMINATE,
+	NL80211_CMD_NAN_NDP_STATUS,
 
 	/* add new commands above here */
 
@@ -8120,8 +8132,8 @@ enum nl80211_nan_conf_attributes {
  *	%NL80211_CMD_NAN_NDP_INITIATE and in an accepting
  *	%NL80211_CMD_NAN_NDP_RESPOND. The driver carries these values in the NDPE
  *	Service Info TLV (Generic Service Protocol). If the peer does not support
- *	NDPE, these values are not conveyed. Peer-request notifications include
- *	the pair when it was included by the peer.
+ *	NDPE, these values are not conveyed. Peer-request and status notifications
+ *	include the pair when it was included by the peer.
  * @NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL: u8 IANA protocol number. Must be
  *	supplied with @NL80211_NAN_NDP_ATTR_TRANSPORT_PORT.
  * @NL80211_NAN_NDP_ATTR_CHANNEL_FREQ: optional u32 channel frequency in MHz.
@@ -8133,13 +8145,17 @@ enum nl80211_nan_conf_attributes {
  *	%NL80211_CMD_NAN_NDP_INITIATE and
  *	@NL80211_NAN_NDP_ATTR_CHANNEL_FREQ. The requested channel must be included
  *	in the NDL. If it cannot be used, for example because it is incompatible
- *	with peer availability, setup fails.
+ *	with the peer's availability, setup fails and the failure is reported
+ *	with %NL80211_CMD_NAN_NDP_STATUS.
  * @NL80211_NAN_NDP_ATTR_ACCEPT: flag. If present in
  *	%NL80211_CMD_NAN_NDP_RESPOND, it accepts the request; if absent, it is
- *	rejected.
+ *	rejected. In %NL80211_CMD_NAN_NDP_STATUS it indicates setup succeeded and
+ *	@NL80211_NAN_NDP_ATTR_RESP_NDI is present.
  * @NL80211_NAN_NDP_ATTR_REASON: u8 Wi-Fi Aware reason code, not an IEEE 802.11
  *	reason code (%NL80211_ATTR_REASON_CODE). Used for rejection with
- *	%NL80211_CMD_NAN_NDP_RESPOND.
+ *	%NL80211_CMD_NAN_NDP_RESPOND, setup failure with
+ *	%NL80211_CMD_NAN_NDP_STATUS, or termination with
+ *	%NL80211_CMD_NAN_NDP_TERMINATE.
  * @__NL80211_NAN_NDP_ATTR_LAST: Internal.
  * @NL80211_NAN_NDP_ATTR_MAX: Highest NDP attribute.
  */
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index acbaf745df9f..45d5c630e2a9 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -19070,6 +19070,87 @@ void cfg80211_nan_ndp_request(struct wireless_dev *wdev,
 }
 EXPORT_SYMBOL(cfg80211_nan_ndp_request);
 
+void cfg80211_nan_ndp_status(struct wireless_dev *wdev,
+			     const struct cfg80211_nan_ndp_status_params *params,
+			     gfp_t gfp)
+{
+	struct wiphy *wiphy = wdev->wiphy;
+	struct cfg80211_registered_device *rdev = wiphy_to_rdev(wiphy);
+	struct nlattr *ndp_attr;
+	struct sk_buff *msg;
+	void *hdr;
+
+	if (WARN_ON_ONCE(!params->peer_nmi || !params->init_ndi ||
+			 !params->ndp_id || wdev->iftype != NL80211_IFTYPE_NAN ||
+			 !(wiphy->nan_capa.flags &
+			   WIPHY_NAN_FLAGS_OFFLOAD_NDP)))
+		return;
+
+	if (WARN_ON_ONCE(params->accepted && !params->resp_ndi))
+		return;
+
+	trace_cfg80211_nan_ndp_status(wiphy, wdev, params);
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, gfp);
+	if (!msg)
+		return;
+
+	hdr = nl80211hdr_put(msg, 0, 0, 0, NL80211_CMD_NAN_NDP_STATUS);
+	if (!hdr)
+		goto nla_put_failure;
+
+	if (nla_put_u32(msg, NL80211_ATTR_WIPHY, rdev->wiphy_idx) ||
+	    nla_put_u64_64bit(msg, NL80211_ATTR_WDEV, wdev_id(wdev),
+			      NL80211_ATTR_PAD) ||
+	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, params->peer_nmi))
+		goto nla_put_failure;
+
+	ndp_attr = nla_nest_start_noflag(msg, NL80211_ATTR_NAN_NDP);
+	if (!ndp_attr)
+		goto nla_put_failure;
+
+	if (nla_put_u8(msg, NL80211_NAN_NDP_ATTR_ID, params->ndp_id) ||
+	    nla_put(msg, NL80211_NAN_NDP_ATTR_INIT_NDI, ETH_ALEN,
+		    params->init_ndi))
+		goto nla_put_failure;
+
+	if (params->accepted) {
+		if (nla_put_flag(msg, NL80211_NAN_NDP_ATTR_ACCEPT) ||
+		    nla_put(msg, NL80211_NAN_NDP_ATTR_RESP_NDI, ETH_ALEN,
+			    params->resp_ndi))
+			goto nla_put_failure;
+	} else if (nla_put_u8(msg, NL80211_NAN_NDP_ATTR_REASON,
+			      params->reason)) {
+		goto nla_put_failure;
+	}
+
+	if (params->ssi && params->ssi_len &&
+	    nla_put(msg, NL80211_NAN_NDP_ATTR_SSI, params->ssi_len,
+		    params->ssi))
+		goto nla_put_failure;
+
+	if (params->ipv6_intf_id &&
+	    nla_put(msg, NL80211_NAN_NDP_ATTR_IPV6_INTF_ID,
+		    NL80211_NAN_NDP_IPV6_INTF_ID_LEN, params->ipv6_intf_id))
+		goto nla_put_failure;
+
+	if (params->transport_info &&
+	    (nla_put_u16(msg, NL80211_NAN_NDP_ATTR_TRANSPORT_PORT,
+			 params->transport_port) ||
+	     nla_put_u8(msg, NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL,
+			params->transport_protocol)))
+		goto nla_put_failure;
+
+	nla_nest_end(msg, ndp_attr);
+	genlmsg_end(msg, hdr);
+	nl80211_send_nan_ndp_event(wdev, msg, gfp);
+	return;
+
+nla_put_failure:
+	nlmsg_free(msg);
+}
+EXPORT_SYMBOL(cfg80211_nan_ndp_status);
+
 static bool nl80211_nan_is_sched_empty(struct cfg80211_nan_local_sched *sched)
 {
 	if (!sched->n_channels)
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 09fe1e52431e..518fdc91f534 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -4690,6 +4690,79 @@ TRACE_EVENT(cfg80211_nan_ndp_request,
 #undef CFG80211_NDP_REQUEST_FMT_4
 #undef CFG80211_NDP_REQUEST_FMT_5
 
+#define CFG_NDP_STATUS_FMT_1 \
+	", peer_nmi: %pM, ndp_id: %u, init_ndi: %pM, "
+#define CFG_NDP_STATUS_FMT_2 \
+	"resp_ndi: %pM, accepted: %d, reason: %u, ssi_len: %u, "
+#define CFG_NDP_STATUS_FMT_3 \
+	"ssi: %s, ipv6_intf_id_present: %d, ipv6_intf_id: %s"
+
+TRACE_EVENT(cfg80211_nan_ndp_status,
+	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev,
+		 const struct cfg80211_nan_ndp_status_params *params),
+	TP_ARGS(wiphy, wdev, params),
+	TP_STRUCT__entry(
+		WIPHY_ENTRY
+		WDEV_ENTRY
+		__array(u8, peer_nmi, ETH_ALEN)
+		__field(u8, ndp_id)
+		__array(u8, init_ndi, ETH_ALEN)
+		__array(u8, resp_ndi, ETH_ALEN)
+		__field(bool, accepted)
+		__field(u8, reason)
+		__field(u8, ssi_len)
+		__dynamic_array(u8, ssi, params->ssi_len)
+		__field(bool, transport_info)
+		__field(u16, transport_port)
+		__field(u8, transport_protocol)
+		__field(bool, ipv6_intf_id_present)
+		__array(u8, ipv6_intf_id, NL80211_NAN_NDP_IPV6_INTF_ID_LEN)
+	),
+	TP_fast_assign(
+		WIPHY_ASSIGN;
+		WDEV_ASSIGN;
+		memcpy(__entry->peer_nmi, params->peer_nmi, ETH_ALEN);
+		__entry->ndp_id = params->ndp_id;
+		memcpy(__entry->init_ndi, params->init_ndi, ETH_ALEN);
+		if (params->resp_ndi)
+			memcpy(__entry->resp_ndi, params->resp_ndi, ETH_ALEN);
+		else
+			memset(__entry->resp_ndi, 0, ETH_ALEN);
+		__entry->accepted = params->accepted;
+		__entry->reason = params->reason;
+		__entry->ssi_len = params->ssi_len;
+		if (params->ssi && params->ssi_len)
+			memcpy(__get_dynamic_array(ssi), params->ssi,
+			       params->ssi_len);
+		__entry->transport_info = params->transport_info;
+		__entry->transport_port = params->transport_port;
+		__entry->transport_protocol = params->transport_protocol;
+		__entry->ipv6_intf_id_present = !!params->ipv6_intf_id;
+		if (params->ipv6_intf_id)
+			memcpy(__entry->ipv6_intf_id, params->ipv6_intf_id,
+			       NL80211_NAN_NDP_IPV6_INTF_ID_LEN);
+		else
+			memset(__entry->ipv6_intf_id, 0,
+			       NL80211_NAN_NDP_IPV6_INTF_ID_LEN);
+	),
+	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
+		  CFG_NDP_STATUS_FMT_1 CFG_NDP_STATUS_FMT_2 CFG_NDP_STATUS_FMT_3
+		  ", transport_info: %d, transport_port: %u, transport_protocol: %u",
+		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->peer_nmi, __entry->ndp_id,
+		  __entry->init_ndi, __entry->resp_ndi, __entry->accepted,
+		  __entry->reason, __entry->ssi_len,
+		  __print_array(__get_dynamic_array(ssi), __entry->ssi_len,
+				sizeof(u8)),
+		  __entry->ipv6_intf_id_present,
+		  __print_array(__entry->ipv6_intf_id,
+				NL80211_NAN_NDP_IPV6_INTF_ID_LEN, sizeof(u8)),
+		  __entry->transport_info, __entry->transport_port,
+		  __entry->transport_protocol)
+);
+#undef CFG_NDP_STATUS_FMT_1
+#undef CFG_NDP_STATUS_FMT_2
+#undef CFG_NDP_STATUS_FMT_3
+
 TRACE_EVENT(cfg80211_incumbent_signal_notify,
 	TP_PROTO(struct wiphy *wiphy,
 		 const struct cfg80211_chan_def *chandef,
-- 
2.34.1

