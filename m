Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983811;
	b=FcehlY0IDE9TDGrY1de06u5E9wMAbtVgLQrlOD1NdxcF/NaJnvCYgUc1OtUtR2FyEbQ0
	 qbU5fLFQANyHWKMNN6ZnUH5puz+1YLGp1KO8u/rJfy5g1/2ba3DRV1K6i6WYr/xGHgVRd
	 Jv5/TBfBRtc666sjdHLni1ia2eGsqVIrbmabZL1tSn7K7OfNZ7YQG/z1bpdNTcQ6Ohufv
	 PD8vpkCLCBpF3W59MHpb0sTGTsWDBw6FiF9De/Ut+SzsDLila8tM58S8CKDFG/ahPma+G
	 OVNXsdmfLkvH1wS+hLmlTn4AUnPrF7zQm5MKlXUY0MZN6Y+7Vf1yxvQdMo2hZvYJPsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ve0+Umiqjo0RplnNI1mpQ0AdQ0vzTTTWkgBKglgZmUg=;
	b=iKPbt+mt4AKzdUGurrvhnoKcsQH6eJnQ98zcWfAALVPOs4b4TwMuXULxJ0bUfKajhugs
	 xvewV7qF6IP14CfANfvolTGNHJ2XuvhDTjDFgH2zrGdk3pOm6ZDpiygmPi6T9bvH71u/O
	 ejhU+k0Ufla8nRKh+UpNT92pFR9thLcVhrQ6nAGfjU5Z3D49Le6dMoj9hsp3YRb/EGeqv
	 sEtJKKQ4xZe14BDZjnFkSQNgJc/J2qKBobdsvS21AyIlIrqwoE0tbXK15/GH+zZbeYvjt
	 dc7kqnIh4JUTxLlENOLZrPkUrTXhFjyek7B4LmVbDDuQ1mCuAY20MsiOiTRqOD1aJLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I0lG0chM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JsTva9Ae;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3B0606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C3B0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I0lG0chM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JsTva9Ae
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uw2C2602462
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ve0+Umiqjo0
	RplnNI1mpQ0AdQ0vzTTTWkgBKglgZmUg=; b=I0lG0chM9GfkxHWYuW3I0IdkfdA
	Al5QEj5eflkU7wWbXBEGlvCV7TjRM7DCFZ8zR/fIzddC9/GMvUVq51BMHcmiHPym
	XjWQE8fNXqts92YTvBzBga8Wp3oks20CDPRRB2wq1FXGFaP7IxIWjx1VaeECrEsR
	pH+FgSGcPV1ag0Xisyfn3SRvpnZpfby5Ed6VFFaaMZjwNto/jO6GO23CP//Hrp/v
	Pt+Kf9wpraNikMFxfPp0pyrITPwUCHYPUjqn2o2CgTg18PhlQCSmoijJutMuy/Fz
	Cdlo07S/FUrz7nFlwcYJOfWcgWRzs1Bj2ElMmsCHk6N03EXY/uNOq14owqA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71m5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36de26cb4b3so670396eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983810; x=1795588610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ve0+Umiqjo0RplnNI1mpQ0AdQ0vzTTTWkgBKglgZmUg=;
        b=JsTva9AeZU/zJJVBlQ0+5JTQhXG+k2WuvVbdgIRSbLVsDEUTUpe9PM9sSn1+4ahkJ/
         W7VB+GxSPLy4EGb3ZoaWXX52EjSKhjJL1igu9QYuiYC/hcQdr+6eJiLhMx1aB6ZHUqH6
         Xol5lT+TZQmMqe/je+VPXmCKw91ghXKLMPwX/bB6AiOYP5PKxZFoiLoGKtK80Tk3eyvY
         utXxXNZCr3HPiK3NwmMuhMU1euHLvLmdpUSynE092uJ9r25N44jM9HSQfkyydkgbayaQ
         6B4Za3N8h/TArR/+k6uP6P12LV66gdLFK4mUQQe/RCHLT9ODknJQOnhWQckLn9Qazy9D
         u+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983810; x=1795588610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ve0+Umiqjo0RplnNI1mpQ0AdQ0vzTTTWkgBKglgZmUg=;
        b=V/8lp41e89yO3mSP2KND5lTjL90xD1NsbpdjiFku90hoNVKFaEc+7WSsbZ5i0m4bc1
         qZKudR92iTArXoo8VKMtU/87OCQhsjxu0cm0TLRo7COoyZQrqjpLKRebPzDaSpd6+5Zt
         4UsbFYy+f4vfQdtQwTlkGZMJorgxgw3y54pCTV3vO39F5kQU4YtoClk8FOnAXEcXp2uQ
         tcgYvouUqoduQ8qFERvbJ3WUGaadMZnzimCmRHx6Pi/pOVa8p/ZY1dnf7TyYJJDLuB9a
         1WDAzZN1cz8H81EfnxwK3fa4RefLmMiSYFkHsrh+EtdvVlejUed5vhhpGJguFcgGyQEK
         cVBA==
X-Gm-Message-State: APuU4Z9RWMX2b1RGJydl13MU2A/VtKGLkShtcTRcEp4PSYjO3gaZ4m6B
	JZATR9ZYta15Yx4AI8Lnwgj9KRP5ZOxb2gxySx+XPIBT5WSazcouvwxqTsr2EV0DRvfpBgATnXW
	rhkwSdkMFpQVA1bllo6w2tFgbvEg3lNeqRuGysyW/g1Tn33VlwieWmupa2bJxRWASCtzGOQ==
X-Gm-Gg: AZFdTZdr0BDabscl9SJNtRyn9d+V05Cv3fXiMMe1qeF7cWwdRsFAAh1Ak8xvQFUk9o1
	UBnSwtTxyq2Ir2JUZigMFErjFywnxvb8EAnBqOlktpWLMmUSUhAQkAOwtQsLYP/GCfbtgQnwrEH
	CvZQbmrcSNiy/gdZ2U/trVA62PQxtwf0/LF3BnKjQQkE2jB/QCoG4fLVfgrj2purhCevRzhfPBv
	cwA1hN7MqLwaOiPD+QdPZCx+F2VAeAWDNhWLa0cL7Pq5ZbslUN88m7gBqmjwW7Nb6eNFaeIKsuI
	wdxK5EsBsBMThumCnZw4eHrSqakrM40JrUNwIrNFEfZ2pEwmOip7lSXEm/Rl/wGFu2h0Qdfv+tn
	IBjUND2lMjlXKh/Y0Tte/PJc2x/HS8Bwyw0BOqN7aDmGPGKgEdGCa5lPJHlfa1Jp22qHz97ximI
	T12+c9phBVTA==
X-Received: by 2002:a05:7300:e31c:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-38281bfb693mr1681920eec.22.1794983809465;
        Tue, 17 Nov 2026 22:36:49 -0800 (PST)
X-Received: by 2002:a05:7300:e31c:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-38281bfb693mr1681902eec.22.1794983808867;
        Tue, 17 Nov 2026 22:36:48 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:48 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 14/19] wifi: nl80211/cfg80211: add support for NDP status indication
Date: Wed, 18 Nov 2026 12:05:49 +0530
Message-Id: <20261118063554.2260397-15-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-GUID: sD_V5NkOpl3rkH3QUpSRFakkK17KKSdE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX49HIkuD3YCz9
 hD842epZ+oTJ7AG/wsSH5ltIce5b2gte2E6rEfeKKn2Qlq4n/HUgKGJaHhjXr/ArCQHgRqzc8J4
 3MaXKKim3Qu+qrfgCs836vH36CIsD/DGfEzyQZTvjzh3WmGlgxxbazrE7ePik3cZ4XVYayGZmN3
 J633if2isNxEHXhgr2XmKswauVi4BVirfIV+OJC/49EfhsbUvm/N+mhwLjobZ1JZJPImvq33ia5
 mutRDPc5OA5T2CHoVesr3NvK1xWWIy2otzaUAjkE73RDg06nXJk1jMMYGpfWlHskn15EO23JnNl
 GINF+TyvSh7N83OlBn2gG2ia4rBcvJKjzcY0dNJLvFHAVahd34tv3zgqGKWFy8Jehv+K+j9ZChM
 5nOXlwQBQAAzFPBjgArVCNlN7sGe2OY8O8Hzq5xjcgbDvOP6YfYP5yRql7dPcbC4xGGb6e01M0b
 1EWoBNvxuD/zzlSbQ2g==
X-Proofpoint-ORIG-GUID: sD_V5NkOpl3rkH3QUpSRFakkK17KKSdE
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd4782 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=KIs_r_sxcAyzomjtXGYA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfXzd7siqSdeoej
 GfBPS9ifwiMw/+qrbh/atHUvWiBaXG3WvvmQ1RTLaEzbYtlCFWDgyZej7QmlN9vd7h+dHvIzg+I
 +7v88EgsmQ18R8SVdd0jccqMeaCwHmA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

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
 include/uapi/linux/nl80211.h | 23 ++++++++--
 net/wireless/nl80211.c       | 81 ++++++++++++++++++++++++++++++++++++
 net/wireless/trace.h         | 73 ++++++++++++++++++++++++++++++++
 4 files changed, 226 insertions(+), 4 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index caff65d0c801..6c3902939132 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4550,6 +4550,43 @@ struct cfg80211_nan_ndp_request_params {
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
@@ -11729,6 +11766,22 @@ void cfg80211_nan_ndp_request(struct wireless_dev *wdev,
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
index 5c2dbe4f1463..a0d0d77346d4 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1617,6 +1617,17 @@
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
@@ -1908,6 +1919,7 @@ enum nl80211_commands {
 	NL80211_CMD_NAN_NDP_INITIATE,
 	NL80211_CMD_NAN_NDP_RESPOND,
 	NL80211_CMD_NAN_NDP_TERMINATE,
+	NL80211_CMD_NAN_NDP_STATUS,
 
 	/* add new commands above here */
 
@@ -8218,8 +8230,8 @@ enum nl80211_nan_conf_attributes {
  *	%NL80211_CMD_NAN_NDP_INITIATE and in an accepting
  *	%NL80211_CMD_NAN_NDP_RESPOND. The driver carries these values in the NDPE
  *	Service Info TLV (Generic Service Protocol). If the peer does not support
- *	NDPE, these values are not conveyed. Peer-request notifications include
- *	the pair when it was included by the peer.
+ *	NDPE, these values are not conveyed. Peer-request and status notifications
+ *	include the pair when it was included by the peer.
  * @NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL: u8 IANA protocol number. Must be
  *	supplied with @NL80211_NAN_NDP_ATTR_TRANSPORT_PORT.
  * @NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS: optional u8 Minimum Time Slots field
@@ -8234,10 +8246,13 @@ enum nl80211_nan_conf_attributes {
  *	%NL80211_CMD_NAN_NDP_RESPOND.
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
index c9b7a5b4600a..f0f25aa71b22 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -19081,6 +19081,87 @@ void cfg80211_nan_ndp_request(struct wireless_dev *wdev,
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
index be7b3162c821..7c3d8b3ac94f 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -4773,6 +4773,79 @@ TRACE_EVENT(cfg80211_nan_ndp_request,
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

