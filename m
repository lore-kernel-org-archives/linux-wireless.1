Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565410;
	b=PK7yGKWyEFbZFNC5xRYuQqnzTTWCz/LzdYZU8NBZMffS+dfn7EyZ0QnYM+b1wQoAlfYT
	 gnZ2GmKP3Z3wmBjNc3DDWU1du2Oy4YjxqYM/Mon0z+WkiD8PdHR/jcx/C+gF/NXGYNg9l
	 iKOIftRndPwuR8ipNuWEVG1aQyBhGRAGMZx4SllECOaEXMDh+ux7X6yRnc24Q/8Bl49iG
	 uNCjZJyl0H2SfW2YWvQKpUYlfjQ+LWO7+PAE/UBngfHOlOUqPJQjKdw8mxR7VRiZYNfFb
	 ICL7HvUwv5iKufVojDl3i8ZVupwzMFjtCyW/Mk4g7Y7ICgAdCBAEPXv3riHzw3zeYRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qLM3ugYWOdmYHbPPAGT5vhKjCRq7m5ChfJ8gqT/5Y/w=;
	b=yaK2WjDAm2/5LwUvpWQp6BRFGYUNcwyvVCURP3GdV3HWZ8ASAl/bwtckhQQFEtuU2/pT
	 KX4lqOfH2FVde9HJM5kMUUhpKEmABysCIlbNr8oYuhX0HlCIHa+5Y2HV4LF/PIljKIpTB
	 O09VmQgqnVriaPon5NB2zLwgfII2064KmIwPFHTxRA2rOEj30svu7yXX4yvHzguGZK8QJ
	 2GCA3h9QeiZiyS9PuaQdb3WQ+a57gCS8lRaJXO8YL4PBbgUOV+EMutCBhLG5SGT3j8jbd
	 MZpYYzd2T/9uYDVhp/9OnEXpcR1HaSc2hF5VoVe6DSxjjhe/j4ULaMf7isiTk+hmcRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mCCs+W/s";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=buimGUnm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A8B606A33A
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A8B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mCCs+W/s;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=buimGUnm
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8UwvP3164560
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qLM3ugYWOdm
	YHbPPAGT5vhKjCRq7m5ChfJ8gqT/5Y/w=; b=mCCs+W/sbWFMAOmpmO1HrR1IrA4
	I5K4WnrI00/orPiSvwIV3Vdxui4+ktkSOiSSE+FU/uXKHACJUNjemaTb64VcBjIM
	phf+L2XHzLeNB409eil/DAKIYSGSa4KSraMvtP+fzC9M+651q+361KBUIh/N6i2v
	vmmfYB+wGBKy7cffRllj87DySsniZ8ewu2GdFZGnNAqjHh4Xn7EFvDgR/gcSDNwM
	DfseuoG1R+EZj1x2ZFfgs1bbRoLOAaekQdEdjtVrtPjjgaR+XeglC5TSG94vf+xp
	6iY8wp8E8/8K92HSKl/t1CnYe/tKlIIu3QD05YzV4eWrOmXF2ju8ltS6LmQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2ms9mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37549877380so1065441eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565408; x=1795170208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLM3ugYWOdmYHbPPAGT5vhKjCRq7m5ChfJ8gqT/5Y/w=;
        b=buimGUnmggSLwFmbeoi5+RDHMVuDkVr/jrFyMUdD3Oi4ceqRFAyz112fRiT4pk9xAT
         GtrWZz+Pf7DW+GW28Jg3J6ZU/tf+5mxvxvMP+Nh7eBYYJsNO6LXo87pQo6ek3d2NZRFu
         qPWw55qmrEGiMBAa6KVYTnuwjzINsk+TPJTDfPHnGED6eaz0RrnHY4Z1S5jGoa1cVq4p
         wfa64mK0OJUXM9d0IH5VPDhA2GJ3ZkOFZTqYJfaiEU8Ma1bFNVZtPy3LlcPr5QmvSMG2
         zhs3dNfHcT9bfZg0CDPr9G7eZv6hh7+grrTJAgkau7m20p4NN93gRym7LOZOv6C5po6U
         NzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565408; x=1795170208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qLM3ugYWOdmYHbPPAGT5vhKjCRq7m5ChfJ8gqT/5Y/w=;
        b=sijat1gRXSp+4X6SnvXYDkoDj3zvm33hwRTQuW04hLnxgEeEpG+05Y9Pp56++Ku9dA
         AfBa713aiKqhJKye5PN2b/YM+iuwy5RGcNlZpTEUqaW89nNeP6k9cPgCOgkelN5fuClB
         MO5+UwVpNd/ysYyMvCbxUI53Uh59aqAax6a4MI5YzYnjVDnQ/f69oLdkP4nGwCfeYxPO
         zXDFxgXbGbHPj3HmLSE8mOdcTeMMber4BnSVV9mfclfD5U+jv1KHG7T8+vUdU+6Q525M
         rzdlU3tZccBx9BuVChrs1Ynu7il6kJGXkwlZLyVgB3ZdNQMz7HieR7GOsp0gfCYso9VV
         0dog==
X-Gm-Message-State: APuU4Z/Sj3msPPg5EZpJWVxeiJsXqRiOXnRrv0li6tVcHRpllmU8+qh8
	PgIoKm2lyMHmYLAedwNKfeIPJQY/zO5NBHPa8cm5+cvDSSwxJcqXGb/ieJduMWShlL2tvR8BU3D
	p3pDa7JHidBzCWAIzLgQoGQY9H5hn29Yi9K35zowbS1RxzfpSUymfRAkJfMZpo3Z3RLCPXw==
X-Gm-Gg: AYBFou1r6y8GWYYsI3HHNRgz+wyFdGL9sC1AceC+BtMoLAUKHqxLG0xqfBrkWiVPTBu
	Eh852KXUuAGlRKGFfPhPfI78X+APTjxHXnIwHhh7rVWODBcvQDiyqBXrt/m/+YVekdwiLE5JZFm
	HKvvVaIaSeuYnIFWW6kSZdSu73WS2zFDlOI1WPBaKmfCJu+PSaoa5Ce84QGcM7azjXyHSD3Yws+
	O7VhmOhqc3Ze84yKO6LmVY7z0YF149xY+nXRH9z3aMtrT0pcQbH4IDQWFUsa5vyuOwtge/xxTR6
	Zip8A4fd/d4ca8ePBtzoT8i+t1Y+n4LFFl/dU8dSwWonUZTCa4Whn4y4vgEsyGHJ6VkajiS63cX
	hZ1rkds7fvWoaq2IQEUOT1qstX/Rdpz+Sa5OStvk2QqLChxQ1ulko+GVVPEbKM9y7OR4wBix0tt
	FKEgQD/Z9V5Hc=
X-Received: by 2002:a05:693c:2585:b0:369:ef63:ea95 with SMTP id 5a478bee46e88-37966e3a7e4mr1516219eec.6.1794565408018;
        Fri, 13 Nov 2026 02:23:28 -0800 (PST)
X-Received: by 2002:a05:693c:2585:b0:369:ef63:ea95 with SMTP id 5a478bee46e88-37966e3a7e4mr1516201eec.6.1794565407302;
        Fri, 13 Nov 2026 02:23:27 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:27 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 15/19] wifi: nl80211/cfg80211: add support for NDP terminated indication
Date: Fri, 13 Nov 2026 15:52:24 +0530
Message-Id: <20261113102228.1917973-16-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: yVs-FCu8DLeoFpM7XbdfdedaLoj19WQf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX+RwObuylUbqD
 +dhl56xDlq4ZitAkkZd0IIR9h68Y7Y3qQ2UZScGt6QHYC1BUYXKXtfhsjEuSbHrNUMG5KziAal6
 th12xmaym8aqVflw52ZiuTPpa4z2/IRlX6vmBHqlmbCdOK/ShL/WlYt+FA4VCHOuH61+B7LWN46
 UqjMbE9XcSyGOKRBoyJTnzrqrpLvo9YwxNEPKNOJKuSp+/onui1oB0HdhB/h5xxtYrG5b/MCyjq
 QXT5EnL0kzJG4TTYYny+NiEd2rDq65KCV1YlKHfWiX6cDocTrvcpL4P5ocmH5k0V/+XNIddwtUR
 hjgOrelySCyQ3XWD1ouosd4Cn7IE/RRndwr2cGXGAKIP4ohf42TCGqNy95m7w5Bm2Z6Ct3DVfny
 Ir4MdFFdHAE5SyMb3gXViX4icu8Sv/U+9YocfYztzPVBNt03dIHqM7rlwGhjhrIhvr9c+PBD3rj
 b4XPJGpGBI4D3LPh6lw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfXzH/4fyZQivPX
 R6jKHJj5oRweAS7voHjs+cfsAEhcM4P63WSObsAryYtdPFhQU4Yr2jKizLbp9KpwNjKFWWd0MtD
 UOCy7KQPxmh97Qs+6NwMwTDg/yUfU1s=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6e520 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=og0APZ68tbi0YRiGhQIA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: yVs-FCu8DLeoFpM7XbdfdedaLoj19WQf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

Use NL80211_CMD_NAN_NDP_TERMINATE to notify userspace when an NDP is
terminated. Include the NDP identity and reason, and add the
LOCALLY_GENERATED output flag to distinguish locally initiated
termination from peer-initiated termination.

Add the termination parameter and cfg80211 notification function,
validate and trace the event, and deliver it to the NAN owner or
multicast group.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 35 +++++++++++++++++++++++
 include/uapi/linux/nl80211.h | 15 +++++++++-
 net/wireless/nl80211.c       | 54 ++++++++++++++++++++++++++++++++++++
 net/wireless/trace.h         | 29 +++++++++++++++++++
 4 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 6c3902939132..99d8eb202f84 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4587,6 +4587,25 @@ struct cfg80211_nan_ndp_status_params {
 	u8 transport_protocol;
 };
 
+/**
+ * struct cfg80211_nan_ndp_terminated_params - NAN NDP terminated event
+ *
+ * @peer_nmi: peer NMI address
+ * @ndp_id: NDP ID
+ * @init_ndi: initiator NDI MAC address
+ * @reason: Wi-Fi Aware reason code for termination
+ * @locally_generated: if true, teardown was initiated or detected locally
+ *	(userspace or device) rather than by a peer termination request. Includes
+ *	NDI down/removal, NAN stop, and peer loss.
+ */
+struct cfg80211_nan_ndp_terminated_params {
+	const u8 *peer_nmi;
+	u8 ndp_id;
+	const u8 *init_ndi;
+	u8 reason;
+	bool locally_generated;
+};
+
 /**
  * enum cfg80211_nan_conf_changes - indicates changed fields in NAN
  * configuration
@@ -11782,6 +11801,22 @@ void cfg80211_nan_ndp_status(struct wireless_dev *wdev,
 			     const struct cfg80211_nan_ndp_status_params *params,
 			     gfp_t gfp);
 
+/**
+ * cfg80211_nan_ndp_terminated - notify userspace that an NDP was terminated
+ * @wdev: the wireless device reporting the event
+ * @params: NDP termination parameters
+ * @gfp: allocation flags
+ *
+ * Notify userspace that a NAN Data Path was torn down. Call exactly once for
+ * each established NDP, including teardown due to NDI down/removal, NAN stop,
+ * or peer loss. Only valid when %WIPHY_NAN_FLAGS_OFFLOAD_NDP is set.
+ * The locally_generated field is true when teardown was initiated or detected
+ * locally (userspace or device), and false when the peer initiated it.
+ */
+void cfg80211_nan_ndp_terminated(struct wireless_dev *wdev,
+				 const struct cfg80211_nan_ndp_terminated_params *params,
+				 gfp_t gfp);
+
 /**
  * cfg80211_incumbent_signal_notify - Notify userspace of incumbent signal detection
  * @wiphy: the wiphy to use
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index a0d0d77346d4..b498d5ef094c 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1617,6 +1617,13 @@
  *	and optionally %NL80211_NAN_NDP_ATTR_REASON.
  *	The command reply acknowledges the request; teardown completion is
  *	reported asynchronously by the termination notification.
+ *	This command is also used as a notification when an NDP is terminated.
+ *	The notification carries %NL80211_ATTR_MAC and %NL80211_ATTR_NAN_NDP with
+ *	%NL80211_NAN_NDP_ATTR_ID, %NL80211_NAN_NDP_ATTR_INIT_NDI,
+ *	%NL80211_NAN_NDP_ATTR_REASON, and, when applicable,
+ *	%NL80211_NAN_NDP_ATTR_LOCALLY_GENERATED. Exactly one notification is sent
+ *	for each established NDP that terminates, including teardown due to NDI
+ *	down/removal, NAN stop, or peer loss.
  * @NL80211_CMD_NAN_NDP_STATUS: Notification-only event sent to userspace on
  *	the initiator and responder sides when NDP setup finishes, successfully or
  *	not. If %NL80211_NAN_NDP_ATTR_ACCEPT is present, setup succeeded and
@@ -8252,7 +8259,12 @@ enum nl80211_nan_conf_attributes {
  *	reason code (%NL80211_ATTR_REASON_CODE). Used for rejection with
  *	%NL80211_CMD_NAN_NDP_RESPOND, setup failure with
  *	%NL80211_CMD_NAN_NDP_STATUS, or termination with
- *	%NL80211_CMD_NAN_NDP_TERMINATE.
+ *	%NL80211_CMD_NAN_NDP_TERMINATE, including its termination notification.
+ * @NL80211_NAN_NDP_ATTR_LOCALLY_GENERATED: output-only flag, present in the
+ *	termination notification when teardown was initiated or detected locally
+ *	(by userspace or the device), rather than by a peer termination request.
+ *	This includes teardown on NDI down/removal, NAN stop, and peer loss; the
+ *	flag is absent when the peer initiated termination.
  * @__NL80211_NAN_NDP_ATTR_LAST: Internal.
  * @NL80211_NAN_NDP_ATTR_MAX: Highest NDP attribute.
  */
@@ -8277,6 +8289,7 @@ enum nl80211_nan_ndp_attributes {
 	NL80211_NAN_NDP_ATTR_QOS_MAX_LATENCY,
 	NL80211_NAN_NDP_ATTR_ACCEPT,
 	NL80211_NAN_NDP_ATTR_REASON,
+	NL80211_NAN_NDP_ATTR_LOCALLY_GENERATED,
 
 	/* keep last */
 	__NL80211_NAN_NDP_ATTR_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index f0f25aa71b22..f32ae55797a5 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -19162,6 +19162,60 @@ void cfg80211_nan_ndp_status(struct wireless_dev *wdev,
 }
 EXPORT_SYMBOL(cfg80211_nan_ndp_status);
 
+void cfg80211_nan_ndp_terminated(struct wireless_dev *wdev,
+				 const struct cfg80211_nan_ndp_terminated_params *params,
+				 gfp_t gfp)
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
+	trace_cfg80211_nan_ndp_terminated(wiphy, wdev, params);
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, gfp);
+	if (!msg)
+		return;
+
+	hdr = nl80211hdr_put(msg, 0, 0, 0, NL80211_CMD_NAN_NDP_TERMINATE);
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
+	    nla_put_u8(msg, NL80211_NAN_NDP_ATTR_REASON, params->reason) ||
+	    (params->locally_generated &&
+	     nla_put_flag(msg, NL80211_NAN_NDP_ATTR_LOCALLY_GENERATED)))
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
+EXPORT_SYMBOL(cfg80211_nan_ndp_terminated);
+
 static bool nl80211_nan_is_sched_empty(struct cfg80211_nan_local_sched *sched)
 {
 	if (!sched->n_channels)
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 7c3d8b3ac94f..b7e1eaa061c8 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -4846,6 +4846,35 @@ TRACE_EVENT(cfg80211_nan_ndp_status,
 #undef CFG_NDP_STATUS_FMT_2
 #undef CFG_NDP_STATUS_FMT_3
 
+TRACE_EVENT(cfg80211_nan_ndp_terminated,
+	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev,
+		 const struct cfg80211_nan_ndp_terminated_params *params),
+	TP_ARGS(wiphy, wdev, params),
+	TP_STRUCT__entry(
+		WIPHY_ENTRY
+		WDEV_ENTRY
+		__array(u8, peer_nmi, ETH_ALEN)
+		__field(u8, ndp_id)
+		__array(u8, init_ndi, ETH_ALEN)
+		__field(u8, reason)
+		__field(bool, locally_generated)
+	),
+	TP_fast_assign(
+		WIPHY_ASSIGN;
+		WDEV_ASSIGN;
+		memcpy(__entry->peer_nmi, params->peer_nmi, ETH_ALEN);
+		__entry->ndp_id = params->ndp_id;
+		memcpy(__entry->init_ndi, params->init_ndi, ETH_ALEN);
+		__entry->reason = params->reason;
+		__entry->locally_generated = params->locally_generated;
+	),
+	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
+		  ", peer_nmi: %pM, ndp_id: %u, init_ndi: %pM, reason: %u, locally_generated: %d",
+		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->peer_nmi,
+		  __entry->ndp_id, __entry->init_ndi, __entry->reason,
+		  __entry->locally_generated)
+);
+
 TRACE_EVENT(cfg80211_incumbent_signal_notify,
 	TP_PROTO(struct wiphy *wiphy,
 		 const struct cfg80211_chan_def *chandef,
-- 
2.34.1

