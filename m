Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565405;
	b=NyfWFRGzR/A8dnChWoV9EyU0RwBc9FwjGC8TgNu2No8JJhiGlGePAmcox8mErvfjjUFi
	 aT3H0mrGgPPa+a015G6qB6b2YMiS80ZGhrPumXMugs7rsN1qt3a3YkyicB6j88hemsX9s
	 R5eR2Bj6VxKgsjwB4BuU6Y3HBpcGZtn2xlcTAgeONdHLCy/DAf6fIug6SUMr/GXJTEbUx
	 YKNeJefvpILJow30fV4bupaBv//rZLA6NAM6ymF1UD23RhBmDuq4k0L8hqKtvpk/E+Pbd
	 HBwdIYHUaLx9fp1c9Hp3ccRR5dnS0+2a8WOp1lcw2PQsW3uSLMxlV06VztFQP9/F1KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f4vJSRhDZHyS73+zYMlmwHlpixBWEVvFN4R+HULRvrM=;
	b=C1PUmBDl8/Es8x98ADhN9HsbWwRGIARlYwam8h9xdudDKXGegejozS2SJCKljJA24lLU
	 Wl3t67+s1uNsRBJ51osXu2KqPdIGEgpLHWU/aBJ5XIXOIm/DB35FqXDMRhwbwMV61JqaO
	 EKZv+iaOBoXOdBUi56OkVMqTe6BSt6Z7BUReRff1QNQS06Yq7i80VoRlL255Y2SDPEwnB
	 QnEWX+T/0h7ELTS+dKte6jdMvUnKzb8vUq5lauDd9ZQl9CT5o8kMbudpeI20OvjOqlnUo
	 nLoeqd9IEwyaPAdO5cXqAidv+3lHgd+G/tb0K17ttgHN1vMLzkPkurvm77y3c1f/86A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BA8z1IDi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VeBR/42r";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64372606A339
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64372606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BA8z1IDi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VeBR/42r
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VTkb1527775
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f4vJSRhDZHy
	S73+zYMlmwHlpixBWEVvFN4R+HULRvrM=; b=BA8z1IDiRqahLO2lrUI9U3EjzVJ
	cDyneXyyIZzJcQro0MSkNJcBsXBU8PUG8wiAVplAnuam/AZ9sKa03tWlosEuBH7i
	tVl/ZzI4qezCgU7FjoInaCUQTRTYuRYI6LI/qtfmgZEhAfVEIe7DZgP+7CsbBElX
	Duwg0NxJ64nAwjBSFxVfAO1LTLC43JD5pAaaD38P7975jL46dTtthye8UiAQ1AtF
	Xv2fv/2W65G7LU2d+7bfOweitn436j8v2rZ8/huxHx71Z2iZhpeinsOAeu9PCqnY
	7iTnkOIhpGNkd3mMhYsq2zKcU6Qbdb9VhrHthBBkT2X5wGN9I7CG9NQNJ+Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8tg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso3744741eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565403; x=1795170203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4vJSRhDZHyS73+zYMlmwHlpixBWEVvFN4R+HULRvrM=;
        b=VeBR/42rjsj9yJgcocFdJkfYJ4zhf+zuLm3GhN22FmjR7tJeaHEyY8EPw0ZCX7z6Ww
         b1BeO528bx7L3uMLBfVa3u230M4PZ3E9st+49A/1C8OZS3Zz5lQwro8Vwb8RWOAMMnBG
         fxHe3q5Ca35cqQ5cdbWPxX9v7bH3LDs4PcnaXRj9/svaubBZSy+5Qo2fmwfn3qc4AHv6
         RlDWgZ9dGJSom3kEWgvrohsDpYNkPMTEP0owIlZbNSrZC8FuypaTz4jF4kHHor7Ljs0h
         JVKzFI5c3UieIvsdbCaMBOOLwvttEuzURnauFPQGHMlCITDL2QFL6QejubXEg0DdpqWc
         W48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565403; x=1795170203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f4vJSRhDZHyS73+zYMlmwHlpixBWEVvFN4R+HULRvrM=;
        b=bxgM90puYl/tryfshqg8TtlBXJMj/+74qiCNw2ZTkniZH8WCaOvpz9LTt1dG0hy6Um
         YCEIhjaR+XSnZJUXsXwrWg7jm6Ijh/iT1fT1mRVzrxvjF4h7YMMaFHiHsm/XPYRn9ibl
         bTGOv3d+ooZlBTb3zkcL/SqJ+Ysz9BryzVx52IbApjSahdtfXB7XHC6UjLFha8be+6VL
         CJAMSgQtKpLVc6pK18gCtwsKrM0TM5P9ZOtHP+wKTDBRFcD+KBWibxx1+nzT6+TX/CN9
         I0FPj9Xyxbu8q5cChzXwmyCh9rrV2OH74YRXl2c9vHy++7BTE+EuLzjXAuV/Mglg1qZx
         L9WQ==
X-Gm-Message-State: APuU4Z+sM5NC/KsI/4BWcu2musU3ZXUoplq6aESxb8rhuBWvKaOsDKjz
	fsyxHCBuNXOdcRN8oyJssaL+mCEFOR0QOw5hIUb7vE+4ZXmqbuq3HE0ahQxwo1Sszv0erNiNgwk
	JjuReLbYYeuJ/TTmHV4JtXIwYlNo9Wg1McacMnGhSsQgQFmqC8MUC4vtQkhatZp7Tq2UCRw==
X-Gm-Gg: AYBFou3C9Wcj6swGGX9x5oWOlWoKtOMTXCieK9FTbizE+CygPutqMR9aKDVhbAvFMBj
	4NnL5ZWzFkseow0AiPOL5r3rtjcck14XmC9znp1AngOSiwwOUiP2S9YU6pHa8918pjk7fCAe97H
	A/rXXgosWzAMbd15093Xsth77Jojc7J+raM7calWqwL2s7nDA85uenc9FUOulRvS4hM1ri/4h/c
	sMnErRtVTWg+lrBcRAJ0w08jvz4pUTavo9wtrisqOdMoNT5srlUvW5uJ9RVGx5jBNjT+65J7eBg
	J8/JArxL3ovijU6bZeZ5QxleLxnpYo45XD1AWp+NPRdcRYc3appnePLhg3EBz1pN4BsQnn+WreB
	4PrxYAlPpG2sujdIXDJR/RRRyzDsfqyzTlQQ4Xn6eUfmkdvnls0Dx6l/R2r8uVqTgwjN0X/stvD
	0BGgcWGHL4Nyk=
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-37967314a08mr1724781eec.24.1794565402449;
        Fri, 13 Nov 2026 02:23:22 -0800 (PST)
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-37967314a08mr1724764eec.24.1794565401818;
        Fri, 13 Nov 2026 02:23:21 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:21 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 13/19] wifi: nl80211/cfg80211: add support for NDP request indication
Date: Fri, 13 Nov 2026 15:52:22 +0530
Message-Id: <20261113102228.1917973-14-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX0YzlhhRtEqSJ
 RQ71ejA5uVTmfUsYKEx4pCY+BXwO1OLnCqrIq3NhrzpP3Vv+9Q+/pFNR+xOc8K7Bvw0LXxywXZE
 uec4/GVfI4vspYZ1QaNU+erCCLxoep5Y0chHZaOGj6TYfSC5tLj4vvE5oWFfUbLGKpORzkk/K6N
 ZaE9ivSweCVu+wcTTHIOLpFAWsCl1EIjwk4mJavK7aAlbtUP2FBcrozYEDWc911Wj1EmLoYoOt6
 BN2sFSZXEHaCdnbyefcHB8KSWggURE7w/L3oIP1DNBisihjWawcur7EkBoF9UaltqOHYCQae67K
 yFPQ6Xib+9M5QN7CyOTpKDAXL23Ttf0xXMoRGgymUETfUF1H59+V/osVFy9Uc/8rlS8DVGBXHgs
 maVFYMocbEchAmWSIJITLm+uQtd0i8M7oCQ2NwMD8GiILTZ4Z5H1vksNt44QlcvaaE6pGPU6KU1
 6K4UA+t4OOigakkjwcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfXz+ddVaBRyKbG
 m+/NdODqIJZcyv+nUK0gRdNxId0lVpFrZOfakj554lkhIKUJLsPWfJo8AJI6CQbwuQLJjiTAS7W
 Qb8p5Noj9PrCYog7De0oBw4yZ1Itxss=
X-Proofpoint-ORIG-GUID: B5W8a3KjwvhExKgWfNJC5kWRt3yCel-y
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6e51b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=SSWjfi26J-CRZlj5VBwA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: B5W8a3KjwvhExKgWfNJC5kWRt3yCel-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

Use NL80211_CMD_NAN_NDP_INITIATE to notify userspace when the device
receives an NDP Request from a peer. Provide the received request
parameters through cfg80211_nan_ndp_request() so userspace can choose
the responder NDI and accept or reject the request.

Carry transport port and protocol values received from the peer in the
request indication, so userspace can learn how to reach the peer
service. Validate the notification parameters, trace them without PMKID
bytes, and deliver the event to the NAN owner or multicast group.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 55 ++++++++++++++++++++
 include/uapi/linux/nl80211.h |  9 +++-
 net/wireless/nl80211.c       | 99 ++++++++++++++++++++++++++++++++++++
 net/wireless/trace.h         | 83 ++++++++++++++++++++++++++++++
 4 files changed, 245 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index eda9a073422b..caff65d0c801 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4510,6 +4510,46 @@ struct cfg80211_nan_ndp_terminate {
 	u8 reason;
 };
 
+/**
+ * struct cfg80211_nan_ndp_request_params - NAN NDP request event parameters
+ *
+ * Sent to userspace when the driver receives a NDP Request frame.
+ *
+ * @peer_nmi: peer NMI address
+ * @ndp_id: NDP ID from the received frame
+ * @init_ndi: initiator NDI MAC from the received frame
+ * @publish_id: publisher's service instance ID
+ * @ssi: service-specific info (may be NULL)
+ * @ssi_len: length of @ssi
+ * @cipher_suite: initiator's cipher suite ID
+ * @pmkid: PMKID from the peer's SCIA attribute (16 bytes), or NULL if absent
+ * @gtk_required: if true, initiator requires GTK protection
+ * @gtk_cipher: GTK cipher suite ID, included when @gtk_required is true
+ * @ipv6_intf_id: initiator's IPv6 link-local interface identifier, or NULL
+ *	if absent
+ * @transport_info: if true, the request contained transport information
+ * @transport_port: transport port received from the peer when
+ *	@transport_info is true
+ * @transport_protocol: IANA protocol number received from the peer when
+ *	@transport_info is true
+ */
+struct cfg80211_nan_ndp_request_params {
+	const u8 *peer_nmi;
+	u8 ndp_id;
+	const u8 *init_ndi;
+	u8 publish_id;
+	const u8 *ssi;
+	u8 ssi_len;
+	u32 cipher_suite;
+	const u8 *pmkid;
+	bool gtk_required;
+	u32 gtk_cipher;
+	const u8 *ipv6_intf_id;
+	bool transport_info;
+	u16 transport_port;
+	u8 transport_protocol;
+};
+
 /**
  * enum cfg80211_nan_conf_changes - indicates changed fields in NAN
  * configuration
@@ -11674,6 +11714,21 @@ cfg80211_s1g_get_primary_sibling(struct wiphy *wiphy,
 }
 
 
+/**
+ * cfg80211_nan_ndp_request - notify userspace of a received NDP request
+ * @wdev: the wireless device reporting the event
+ * @params: NDP request parameters parsed from the received frame
+ * @gfp: allocation flags
+ *
+ * Notify userspace that a NAN Data Path request was received from a peer.
+ * This starts a responder-side setup attempt; the driver reports its final
+ * result once, including on rejection, failure, or timeout. Only valid when
+ * %WIPHY_NAN_FLAGS_OFFLOAD_NDP is set.
+ */
+void cfg80211_nan_ndp_request(struct wireless_dev *wdev,
+			      const struct cfg80211_nan_ndp_request_params *params,
+			      gfp_t gfp);
+
 /**
  * cfg80211_incumbent_signal_notify - Notify userspace of incumbent signal detection
  * @wiphy: the wiphy to use
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 54249b98fcc7..5c2dbe4f1463 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1593,6 +1593,12 @@
  *	Aware reason QoS_UNACCEPTABLE.
  *	Each accepted setup attempt completes asynchronously with exactly one
  *	%NL80211_CMD_NAN_NDP_STATUS notification, including on failure or timeout.
+ *	This command is also used as a notification when an NDP Request is
+ *	received from a peer. The notification carries %NL80211_ATTR_MAC and
+ *	%NL80211_ATTR_NAN_NDP with the received parameters. Userspace must ensure
+ *	the responder NDI exists before sending @NL80211_CMD_NAN_NDP_RESPOND.
+ *	Each indicated request is a setup attempt and completes with exactly one
+ *	%NL80211_CMD_NAN_NDP_STATUS notification, including on failure or timeout.
  * @NL80211_CMD_NAN_NDP_RESPOND: Respond to a received NDP request as
  *	the responder. Requires %NL80211_NAN_CAPA_OFFLOAD_NDP. The NDI
  *	interface specified in %NL80211_NAN_NDP_ATTR_RESP_NDI must already
@@ -8212,7 +8218,8 @@ enum nl80211_nan_conf_attributes {
  *	%NL80211_CMD_NAN_NDP_INITIATE and in an accepting
  *	%NL80211_CMD_NAN_NDP_RESPOND. The driver carries these values in the NDPE
  *	Service Info TLV (Generic Service Protocol). If the peer does not support
- *	NDPE, these values are not conveyed.
+ *	NDPE, these values are not conveyed. Peer-request notifications include
+ *	the pair when it was included by the peer.
  * @NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL: u8 IANA protocol number. Must be
  *	supplied with @NL80211_NAN_NDP_ATTR_TRANSPORT_PORT.
  * @NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS: optional u8 Minimum Time Slots field
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 571432435bfa..c9b7a5b4600a 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -18982,6 +18982,105 @@ static int nl80211_nan_ndp_terminate(struct sk_buff *skb,
 	return rdev_nan_ndp_terminate(rdev, wdev, &params);
 }
 
+static void nl80211_send_nan_ndp_event(struct wireless_dev *wdev,
+				       struct sk_buff *msg, gfp_t gfp)
+{
+	struct cfg80211_registered_device *rdev = wiphy_to_rdev(wdev->wiphy);
+
+	if (wdev->owner_nlportid)
+		genlmsg_unicast(wiphy_net(&rdev->wiphy), msg,
+				wdev->owner_nlportid);
+	else
+		genlmsg_multicast_netns(&nl80211_fam, wiphy_net(&rdev->wiphy),
+					msg, 0, NL80211_MCGRP_NAN, gfp);
+}
+
+void cfg80211_nan_ndp_request(struct wireless_dev *wdev,
+			      const struct cfg80211_nan_ndp_request_params *params,
+			      gfp_t gfp)
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
+	trace_cfg80211_nan_ndp_request(wiphy, wdev, params);
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, gfp);
+	if (!msg)
+		return;
+
+	hdr = nl80211hdr_put(msg, 0, 0, 0, NL80211_CMD_NAN_NDP_INITIATE);
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
+		    params->init_ndi) ||
+	    nla_put_u8(msg, NL80211_NAN_NDP_ATTR_PUBLISH_ID,
+		       params->publish_id))
+		goto nla_put_failure;
+
+	if (params->ssi && params->ssi_len &&
+	    nla_put(msg, NL80211_NAN_NDP_ATTR_SSI, params->ssi_len,
+		    params->ssi))
+		goto nla_put_failure;
+
+	if (params->cipher_suite &&
+	    nla_put_u32(msg, NL80211_NAN_NDP_ATTR_CIPHER_SUITE,
+			params->cipher_suite))
+		goto nla_put_failure;
+
+	if (params->pmkid &&
+	    nla_put(msg, NL80211_NAN_NDP_ATTR_PMKID, WLAN_PMKID_LEN,
+		    params->pmkid))
+		goto nla_put_failure;
+
+	if (params->gtk_required &&
+	    (nla_put_flag(msg, NL80211_NAN_NDP_ATTR_GTK_REQUIRED) ||
+	     nla_put_u32(msg, NL80211_NAN_NDP_ATTR_GTK_CIPHER,
+			 params->gtk_cipher)))
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
+EXPORT_SYMBOL(cfg80211_nan_ndp_request);
+
 static bool nl80211_nan_is_sched_empty(struct cfg80211_nan_local_sched *sched)
 {
 	if (!sched->n_channels)
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index a843b52cbcfc..be7b3162c821 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -4690,6 +4690,89 @@ TRACE_EVENT(cfg80211_nan_cluster_joined,
 		  __entry->new_cluster ? " [new]" : "")
 );
 
+#define CFG80211_NDP_REQUEST_FMT_1 \
+	", peer_nmi: %pM, ndp_id: %u, init_ndi: %pM, "
+#define CFG80211_NDP_REQUEST_FMT_2 \
+	"publish_id: %u, ssi_len: %u, ssi: %s, "
+#define CFG80211_NDP_REQUEST_FMT_3 \
+	"cipher_suite: %u, pmkid_present: %d, "
+#define CFG80211_NDP_REQUEST_FMT_4 \
+	"gtk_required: %d, gtk_cipher: %u, "
+#define CFG80211_NDP_REQUEST_FMT_5 \
+	"ipv6_intf_id_present: %d, ipv6_intf_id: %s"
+
+TRACE_EVENT(cfg80211_nan_ndp_request,
+	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev,
+		 const struct cfg80211_nan_ndp_request_params *params),
+	TP_ARGS(wiphy, wdev, params),
+	TP_STRUCT__entry(
+		WIPHY_ENTRY
+		WDEV_ENTRY
+		__array(u8, peer_nmi, ETH_ALEN)
+		__field(u8, ndp_id)
+		__array(u8, init_ndi, ETH_ALEN)
+		__field(u8, publish_id)
+		__field(u8, ssi_len)
+		__dynamic_array(u8, ssi, params->ssi_len)
+		__field(u32, cipher_suite)
+		__field(bool, pmkid_present)
+		__field(bool, gtk_required)
+		__field(u32, gtk_cipher)
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
+		__entry->publish_id = params->publish_id;
+		__entry->ssi_len = params->ssi_len;
+		if (params->ssi && params->ssi_len)
+			memcpy(__get_dynamic_array(ssi), params->ssi,
+			       params->ssi_len);
+		__entry->cipher_suite = params->cipher_suite;
+		__entry->pmkid_present = !!params->pmkid;
+		__entry->gtk_required = params->gtk_required;
+		__entry->gtk_cipher = params->gtk_cipher;
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
+		  CFG80211_NDP_REQUEST_FMT_1 CFG80211_NDP_REQUEST_FMT_2
+		  CFG80211_NDP_REQUEST_FMT_3 CFG80211_NDP_REQUEST_FMT_4
+		  CFG80211_NDP_REQUEST_FMT_5
+		  ", transport_info: %d, transport_port: %u, transport_protocol: %u",
+		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->peer_nmi, __entry->ndp_id,
+		  __entry->init_ndi, __entry->publish_id, __entry->ssi_len,
+		  __print_array(__get_dynamic_array(ssi), __entry->ssi_len,
+				sizeof(u8)),
+		  __entry->cipher_suite, __entry->pmkid_present,
+		  __entry->gtk_required, __entry->gtk_cipher,
+		  __entry->ipv6_intf_id_present,
+		  __print_array(__entry->ipv6_intf_id,
+				NL80211_NAN_NDP_IPV6_INTF_ID_LEN, sizeof(u8)),
+		  __entry->transport_info, __entry->transport_port,
+		  __entry->transport_protocol)
+);
+#undef CFG80211_NDP_REQUEST_FMT_1
+#undef CFG80211_NDP_REQUEST_FMT_2
+#undef CFG80211_NDP_REQUEST_FMT_3
+#undef CFG80211_NDP_REQUEST_FMT_4
+#undef CFG80211_NDP_REQUEST_FMT_5
+
 TRACE_EVENT(cfg80211_incumbent_signal_notify,
 	TP_PROTO(struct wiphy *wiphy,
 		 const struct cfg80211_chan_def *chandef,
-- 
2.34.1

