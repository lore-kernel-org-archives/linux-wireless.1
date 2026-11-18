Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983813;
	b=0AqPKlNOd0Kvgv2sGb6KRymB9F8BtI5XeZJavy4Lz5TrUwwZd16z5j+KnPTjz4kLCbhD
	 de44tHFRiRGx7V7+e0TWNvW0IiEbpcEYmDiPC3kGMHx2JWeDNSnbBzoIrpFtW/6puD8dU
	 vSc8+M/ZRYLzt8jZmo8an78nE3zRnaf+qz9LdTKY2DE66MMY05wWR75bhPlCkvLSMl3MM
	 n3k0PHN61DV6KoE9fvWwAuNUElnis/agUHs+5ZWnhv8JRbLCi1h2m7RV4D45zIMiwrzMD
	 Mk8KOuFSWbm86i0il2VIEMJIfFgkfMRc0gw5Bz1nbdJTYM/2yp6hlpHjn3GOyn78WDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983813;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qLM3ugYWOdmYHbPPAGT5vhKjCRq7m5ChfJ8gqT/5Y/w=;
	b=jI12i+yRrr/lgIR/1KhDA2Eov+3sByXPrWjNsCrlXPqtSjVAHFb69tAc2V9ovfI2zsQZ
	 l0lqB+b5KBiVCDosHxHiV0bcQXqckPoMisoZE6ySXlyAIaeUsA9M0faiUf+TIzUyh78jw
	 4NKT1z6l/Jt/U9hPDmEV+rn8mQWMMJbfBoOpn0vTt/8E44rD2Mz1HdveYfRLGDdJtA2/p
	 Uoa+n6OZMSbw+MuIV3CAr8WaHYyW3WE2fAskGDONUzSN543N6dKO0HJ7Xk1h6vJkqY+t9
	 kiMFTV4OODTLRpqyNWHgrizhC0ps/r0bYjjy5wakBw8sAi4EN4pQ5WGGrY6EOpmZlZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WCr2zzFr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="P7/u3NWo";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CC8606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52CC8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WCr2zzFr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P7/u3NWo
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxqY1959809
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qLM3ugYWOdm
	YHbPPAGT5vhKjCRq7m5ChfJ8gqT/5Y/w=; b=WCr2zzFrYGNteMDSRnEPJ8uUlJe
	SJ9zEYVsmJoHiVqAcdD9ohdLJdXUVFJuSRYSBShlrHKIdqosNsSmgW1VnXVmemEl
	OtdDhhTKOqeV+gNY1XvH0nmRtWv5k37LLh0jx1W8qWyY4gbPFPOL/kSyWEATrmpQ
	uDEa2Sz//IpWImaFpB/GavzWpNNriRw5BAzkrx70AWqzzno3E7uuN4MwPtJyaWL4
	u+ogAD10kMoflS03b8jHFl2/a9wF0Ez/Fj1BdftNrEnQLiWAlPSYVFqkMM+0ULGT
	V2ieCEE82PjzKfGvCz3U2ALq4rAoE2LOX25UAmmzS8B/XGCUTR0o2M86dtg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hk7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:52 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3ae17c536so603240c88.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983812; x=1795588612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLM3ugYWOdmYHbPPAGT5vhKjCRq7m5ChfJ8gqT/5Y/w=;
        b=P7/u3NWo0VotgQlIDrZ3Yu8eYcYiFJ5cq8R6XqcS8VNQtCbwbZEtW4GFl5mCRl/Va3
         rKvEHxhb5pgx/v/jCzMoN4yW0vQzHWtcaQ+chARo1Zy2N+/t6hT2THdTIqpytRpcdhy1
         1rEv7xV0R7ejPgzeG0x5uNdimzhZ3L4o9cyFeN5k3KXyh7dQRT7RikfpEpZVCRSMSdnl
         R20jqoUWK6QUD0901FqCJzdm4fEqAMc7DudHVpRjJEYXvqMqAkzPPSo1J76REY2AgEZY
         H580Iv6I3taT7KMTtAZqoUhEPRIEM1v5o7tVPIwPGAa0SvoErxOqlPpa3hXZUvezNBFK
         BUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983812; x=1795588612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qLM3ugYWOdmYHbPPAGT5vhKjCRq7m5ChfJ8gqT/5Y/w=;
        b=Jv1W+RGjtG6ce4bK5Qrh7bEkqVgXHNdH5QBMskUVtRI3oh3py2a0GSocuCusuwz1HK
         VrAnIWC40Z7W936FiJq9FFMwbItLQoArOh40/+yeakXxjPPvprNUJUzwE93BE9d5U2i8
         bLBqWZNX64UBO6fbLWGhh1rvsk/Ld8Y8VOLHcz628Tg+ctj+U7O09LoL2u8EKshwA3Ho
         D0w6CDjrh4bSbaDolfB+fLhui7pWqLkhYDc3AoJ2COvG+sxa0yjftZ1OR7EMxnA8Bl9v
         dcTck2bknamDbHteq9A3qsjXE4Fcp8WsMDj9M1FLvzzZX2YeQY3yF6HUrtMd8+EatgVK
         KPLw==
X-Gm-Message-State: APuU4Z+1beY2DHrWRSCrgmsBjUBHxruYQG8YsBNDwdg8oh+eNgVKjJHu
	jOLZMBh11VjcEqiYzNJTmQscExHl73vz0E9jqRIgTLOTtRPBVdYSBZPQcXiILoKQ7A5Ilakw7WB
	Rw4+FnFabxZFoFnIpKsbl6esl8O+3/rZdp/wM110drjf83Lm9XbgKWkgPOIEUfcOH0h3P6g==
X-Gm-Gg: AYBFou1VxcG9KkRG2BB9AEAEQD70bKc0YLosZHWJMnZXo3cvpiwxg3WyQ/hcRsEAMxB
	s3UzQoS21P9g3MDpy4C75baJrYJqHu1gGoMh1XWEjyQ/zBADJZ1DhS0FJFnNsESXR8d1Jp8AgLm
	k4t4mklUCMtSYXJzfyJvO3YDGZiJU9cKrpU8Qdlr33axIbL4ffogIBIO0m9bZIUshxB/nHGxkpL
	6tT1TZDnyxIrCfclsgzfx8xNuxRrlNYj83VVPoz0sRpzzVaI5c3x8PCgkOf8ISKYLubfDjZdJvz
	v7drIrX8+tpysH83Xo0SyUwqtZPw3Ne9ipZk3kbEzD2fP0Mfkk98SAvkekVZYJsYXecSzgpQ7BM
	yyg80DBKGsUNR+bVvaNwq+m9ieX9wQjx6kUaVx9AQhRPWoS+TyhLHpGcDZu/iKW4XA6yKMa8D30
	HKbfyrbEfhjg==
X-Received: by 2002:a05:701b:424c:20b0:1b5:18cd:7751 with SMTP id a92af1059eb24-1b543c15c1dmr1816965c88.44.1794983811900;
        Tue, 17 Nov 2026 22:36:51 -0800 (PST)
X-Received: by 2002:a05:701b:424c:20b0:1b5:18cd:7751 with SMTP id a92af1059eb24-1b543c15c1dmr1816951c88.44.1794983811354;
        Tue, 17 Nov 2026 22:36:51 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:51 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 15/19] wifi: nl80211/cfg80211: add support for NDP terminated indication
Date: Wed, 18 Nov 2026 12:05:50 +0530
Message-Id: <20261118063554.2260397-16-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd4784 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=og0APZ68tbi0YRiGhQIA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: cuDm1zKdCzc0bvEJcNHV7dER6TmdaOZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX9hbYH1ULJA15
 FdYh6jicbB7qjnFrNA7J2AKJRqvugnNqkm0jix17VjedT4CUfQWle/1JpYcn3RifwKvKkYs1aZm
 oP42UNHqX1l2wf+bLZxTPfWn6chBa/Cte4Qd3+LaRSfpY2tnAi6v6ANRmvr1u5klzYVaSHuE7gn
 NKg5n8m3wn4e5+MQrU0jTip2T7RhRCk154HSmk6KYM4AOWRwrH/qSSXOz4WogqliwUYrI9+SDmx
 4HBaT9rC20m58JRF29zFbfoOITgWSSr/xJpAqVuWkPEOV4SaKAEcJTq9jI9ArhKcV4AkrXMSc3j
 boJw6I5jwoJ8/02FpXifNL02AujS7nRb6krpY/TmA0L3yajR/Ol9UZCdAHNhvJ8rQwbxX9cPGza
 5INE0Q05b6koodihjJvvTMfwdUxtD/dkhG0zf50+ID36pfEUlNW6t1l/8534j9kVO9rRFgikZm7
 OgWnRQ0NrlA1a5nCuZw==
X-Proofpoint-GUID: cuDm1zKdCzc0bvEJcNHV7dER6TmdaOZ8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX574TqI+Am8vJ
 /x4IJ0NI5noN/6cWQOXf3uy6QuZ8/7BUpQ9SkaF2ThkTOgF4S76nG7/zPMgjwknMsRQe4MPmmsT
 Svz2aZC11/XsoJZn0QRnaKf5e3UQVWI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

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

