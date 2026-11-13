Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565412;
	b=VJ7CSHj5rR3xTkfveYTTBmQl/HJZItYAsBMtK6TxZnn1L9OwGSt5Gw7Zb4/zUnmpFfLT
	 wHPCAPIZO69nYI8DgEZH5yNkoI4a9sdSZgThoILdzNQbKF6ilrHjX6bTTtlySV4mhllGR
	 E2AgaQg/uGLStTdXWHdzdUwXFXcCzx0P5m6mLRTUTIHedCHwXVFc1LHlxTPns+WKRnWou
	 oYe5OsFX5yzmB/kSRNGXYRXKiO6X8QYtADJX1cnosmbOdtzp2RExwRYXrMq28hwjGEq/d
	 FLUvc47VBqyueI9+KV7c3AHpFgms4yJ8yEb1DFOMhno1pQi1iARhSKAxkqIz6HSj8eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rv9m5rHFXABGpDjzxYm/qAiD7MFYUcXs3HWoAiHXBrs=;
	b=I3RqU4eX+yzzB6aWfJWc5wUSxQe8LMFbcE1QEf0vM5IjMPNHvvSrbO8jBlhfzik6mzth
	 slcV+W/wrSN85mTprW7Ut5hIVNV/e1l+knCnXBw9skLiADqDSvvWhVrhY9ewHLYI37onH
	 /195/Z3OdFZluzn8ZzpfrZSIw8s69iXY/f/fJfjaTyWRxqKuoHkupt9MMIx59M8HnrIPb
	 FthMuFSvjYBRUCIrfwmXVnArSmU8AItdg5t8eIwg7y7lX20/dLJbgIz6AYHQe0slXVGeN
	 Kn56fXu7f7Dn89haJsiY7zE6Re6t18Wruky6AcfEcuNI+hz9zI7ZT75dkUrLDSBbtRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dwfKWHTy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="F/VfEr6U";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CD0606A8A5
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54CD0606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dwfKWHTy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F/VfEr6U
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8UvRm3164523
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Rv9m5rHFXAB
	GpDjzxYm/qAiD7MFYUcXs3HWoAiHXBrs=; b=dwfKWHTyj5YWNy7U9vj1PQgtfC7
	ps9uwVLcpWOlOr4FPSPku6ufTY7WcoAwobV0Q1CNQyn4kbm1lCsNj+8eQOGjx+GV
	fx9WbMc5eGYjuES+URpKzeyR+WCqPChjk74o5O3D8753/bzg53rXfBKMXm3E0WLZ
	gf2ngl4mLM28HUZcMecDAOuQLXoGJpUeOx8AF+LsRgFIcG4QY2ng7A7Jq28HhuKq
	Mw84G4C5iNb0dXUykHIIwtJ2plebhjCznZrDr2J5aexINjwFw1zIT+loNqCbhVFw
	EcvgY927vY3GHgIPA7WY6O2Lth6xjU39mRAgHSY7LBkEEasREwJM5q3+AWg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2ms9my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1275161eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565411; x=1795170211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rv9m5rHFXABGpDjzxYm/qAiD7MFYUcXs3HWoAiHXBrs=;
        b=F/VfEr6UQcMMKP91x030WcBS6m/WxJ3RGBJ6tAM9Qh8jQGpvv/HSruhb4Makd/z7GG
         XvueM+TG7bXqJkwuJdsoxEeYZJ9kaOSlv57NlOmLupmNh6hd9CHwZOa2lIv/cSzdL3tP
         oojny+QxhTTRG2UJPeLCpde3Oahol5/VYDwpKv6RzYWrcC+uvjJLzfvzc3u9FXSu6R8M
         XsQ2L7SWEIOQH42NiEe824spmejzfvFMP20gHQ6tlftG3yfsDh3rCPEuN8WPClNBJUK8
         IHLJt4kDPq4K98+BQCxCMVDtaV0MH4S2xymINYqt9wFeXjTWzCzw1Ks1OnpkMz0Zgy1q
         HoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565411; x=1795170211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rv9m5rHFXABGpDjzxYm/qAiD7MFYUcXs3HWoAiHXBrs=;
        b=rLmR+Awyjw88LSvW80ZdBpx2DF14uw+SIQ5U506hIApRUEiQymCJS8oHyJqI8sNSmI
         Zl40AR1pAVSj7i0ZRiPae+G6tJmp73aDpAQK+uTWUysvaTTTSvaRAr/GUl4ZSDFt6L0I
         +lWVPmqy6O5H4d6oKIExL/MTwRb/Afq/Rl8A9ir1lheHdk5/xBJnu2ncdYLqmvVPNBzF
         xfEu9rfcAGRdNfjufka84daAxMLhCngeyuMGeDbVntKvp76sEQkuwFGrxNjmYPQqNFGt
         3RvD/Wf4vnrvviwqoz6T8FUgYjYHF8T/zCPIftwXH4EzZYwW8i3506eDCrH8BiMl6K8p
         q9Kw==
X-Gm-Message-State: APuU4Z8NXfC1KEcrJzq3qWkIH5dOrU6ru2NA5zdyUrrPdL4Mapd4MXxl
	rHutnrpo48t5Zkp9hRp+vcDdBNbZ6iQ1jsqz1/KTG+aF+sSGnV7NpXdhJVLpcKxNlCw7nH6WEEs
	0bd/G/HcaJp1uSRJ9KD2wdNtd5r+R21lBtVAG6DVeXwKNbRGXYa828kSI03v4yS7D10bJDg==
X-Gm-Gg: AYBFou2RpdOZlXA4tbk+IRhaDLqNeuJhJEEyJJmedED6dgEJNROf8z84sCZeTfsyUIR
	4mEVEF7gHGl3m9vKIk8tFwS7qtUml15UqZ6Hk92BUOA0nQjGACk7EpwQTM+/CKei7IjmqUA/GGZ
	R3fJvRYrqQ4rA7M6BKwsAVyB1D4SCEwKTeFx88Qt7SN0qZfcmj3i9ngx0awjTlTM2U2domMA7I6
	STzT/3GK2GlYNWHR2HDFj2G8nj5IVBB8AccHZZNb5oMk+wOXvPW+cUtq/F+x/bKUpmE173pLWwK
	m9/O+EQEDAAdlhcwb5Gwf7PxWHivKzwx2WLnsj3CFiwCZUTClamvj2sksWJospsY36ZxVese4e5
	FnfxLmHSfEZJfrdcBjdWn3yiPYTlHHSW9LI84mppsjjUFyIkMJ6/d1rwMeaQcfdWC0378AJg+PG
	I0NkJTPrbcu+0=
X-Received: by 2002:a05:693c:829b:10b0:370:ff2:f78d with SMTP id 5a478bee46e88-37965ca7d77mr2102572eec.8.1794565410680;
        Fri, 13 Nov 2026 02:23:30 -0800 (PST)
X-Received: by 2002:a05:693c:829b:10b0:370:ff2:f78d with SMTP id 5a478bee46e88-37965ca7d77mr2102538eec.8.1794565409897;
        Fri, 13 Nov 2026 02:23:29 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:29 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 16/19] wifi: nl80211/cfg80211: support updating an offloaded NAN publish function
Date: Fri, 13 Nov 2026 15:52:25 +0530
Message-Id: <20261113102228.1917973-17-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: zFvjCKhfLIRPXyIQyiUhXaCGu6hq6MO8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX7tcl7wf68mJQ
 0g30JiNUKn85i81s5O4BHoCA+3h+k0i2VRV59SYUdt41yuHWYisN4mLN+YIqRftxR9EtdNcoj6f
 u5+psVa1WD5LInRHaelxkCQWCczisNHrulJrAkHmWnfri+d3M/Hqdzd1NT8AZ5WGECksERac4C8
 N7SpkKdHCzDEUvKEeSEeihTdfFJF3Vc5n6U8K78BxCA3SLUD8il2HNNnFLV2HMrhENzqCGdBa3C
 +zoNXLVbhbMSg0YSHX30j5iUAzHs99Lw0D2I+KZCIlCjgvtfclbZ4ZIXmVS4YDVc1ylsYN04QUw
 U7lYEF82s3kRBadduM9vHjkOCXV1FTP7sXhABDs4f6UBdsTa/43H5zWdGdOG4enWikAMUTNn8NP
 /8BzcaeQ9/vmfevArCX2potMJdd9DZDqzNeOK2WCfUlhlErpgp9gHtnXMJt+wi5bPd0TDjRxbLt
 2rJrkILgexTzNsrhKOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfXxj+23rIVnE/I
 B4RSoMfvDwKZoF1zq0VlLRga6Y4QK2cqEVJwKoxkXQQBmTP22hpXVXdtuMXyfRPQmHd+hIokMPL
 dnjoWSH7Xwb3WnrR5SNfQ8P+UMHYP3M=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6e523 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=grxfuFoILc7gH7VXXwgA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: zFvjCKhfLIRPXyIQyiUhXaCGu6hq6MO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

With an offloaded NAN Discovery Engine, userspace may need to change the
service-specific information of an active publish function.

Add a separate NL80211_CMD_UPDATE_NAN_PUBLISH command, identified only
by a non-zero cookie, to update the service-specific information as
specified by the UpdatePublish method in Wi-Fi Aware v4.0, section
4.1.1.1. A zero-length value clears the information. All other function
parameters remain unchanged, and the update does not change the
remaining lifetime (TTL).

Keep NL80211_CMD_ADD_NAN_FUNCTION semantics unchanged for existing
drivers. Advertise the new command in the supported-commands list when
the driver provides the update callback.

As a new command, it uses strict netlink validation: generic netlink
rejects relaxed validation flags for commands at or above the family's
resv_start_op, which would make registration of the nl80211 family
fail.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 23 ++++++++++++
 include/uapi/linux/nl80211.h |  8 ++++
 net/wireless/nl80211.c       | 71 ++++++++++++++++++++++++++++++++++++
 net/wireless/rdev-ops.h      | 16 ++++++++
 net/wireless/trace.h         | 22 +++++++++++
 5 files changed, 140 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 99d8eb202f84..e44c5da96ece 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4735,6 +4735,21 @@ struct cfg80211_nan_func {
 	bool range_report;
 };
 
+/**
+ * struct cfg80211_nan_update_publish - update NAN publish service info
+ *
+ * @cookie: non-zero cookie of the active publish function to update
+ * @serv_spec_info: replacement service-specific information. The pointer is
+ *	valid only for the duration of the callback and must not be retained.
+ * @serv_spec_info_len: length of @serv_spec_info. A zero length clears the
+ *	current service-specific information.
+ */
+struct cfg80211_nan_update_publish {
+	u64 cookie;
+	const u8 *serv_spec_info;
+	u8 serv_spec_info_len;
+};
+
 /**
  * struct cfg80211_pmk_conf - PMK configuration
  *
@@ -5564,6 +5579,11 @@ struct mgmt_frame_regs {
  *	cfg80211_free_nan_func().
  *	On success the driver should assign an instance_id in the
  *	provided @nan_func.
+ * @nan_update_publish: Update the service-specific information of an active
+ *	NAN publish function identified by the cookie in @params. Return -ENOENT if
+ *	the cookie does not identify an active publish function of this wdev;
+ *	subscribe functions cannot be updated. The service-info pointer is valid
+ *	only for the duration of the callback.
  * @del_nan_func: Delete a NAN function.
  * @nan_change_conf: changes NAN configuration. The changed parameters must
  *	be specified in @changes (using &enum cfg80211_nan_conf_changes);
@@ -6012,6 +6032,9 @@ struct cfg80211_ops {
 	void	(*stop_nan)(struct wiphy *wiphy, struct wireless_dev *wdev);
 	int	(*add_nan_func)(struct wiphy *wiphy, struct wireless_dev *wdev,
 				struct cfg80211_nan_func *nan_func);
+	int	(*nan_update_publish)(struct wiphy *wiphy,
+				      struct wireless_dev *wdev,
+				      const struct cfg80211_nan_update_publish *params);
 	void	(*del_nan_func)(struct wiphy *wiphy, struct wireless_dev *wdev,
 			       u64 cookie);
 	int	(*nan_change_conf)(struct wiphy *wiphy,
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index b498d5ef094c..e6172abab0d6 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1175,6 +1175,13 @@
  *	This command is also used as a notification sent when a NAN function is
  *	terminated. This will contain a %NL80211_ATTR_NAN_FUNC_INST_ID
  *	and %NL80211_ATTR_COOKIE attributes.
+ * @NL80211_CMD_UPDATE_NAN_PUBLISH: Update only the service-specific
+ *	information of an active NAN publish function. The function is identified
+ *	by a non-zero %NL80211_ATTR_COOKIE. Supply the new information as
+ *	%NL80211_NAN_FUNC_SERVICE_INFO nested in %NL80211_ATTR_NAN_FUNC. A
+ *	zero-length service-info attribute clears the current value. All other
+ *	function parameters remain unchanged, and the update does not change the
+ *	function's remaining lifetime (TTL).
  * @NL80211_CMD_CHANGE_NAN_CONFIG: Change current NAN
  *	configuration. NAN must be operational (%NL80211_CMD_START_NAN
  *	was executed).  It must contain at least one of the following
@@ -1927,6 +1934,7 @@ enum nl80211_commands {
 	NL80211_CMD_NAN_NDP_RESPOND,
 	NL80211_CMD_NAN_NDP_TERMINATE,
 	NL80211_CMD_NAN_NDP_STATUS,
+	NL80211_CMD_UPDATE_NAN_PUBLISH,
 
 	/* add new commands above here */
 
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index f32ae55797a5..c74386dc6e01 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -3538,6 +3538,7 @@ static int nl80211_send_wiphy(struct cfg80211_registered_device *rdev,
 
 			if (rdev->wiphy.flags & WIPHY_FLAG_SMD_TRANSITION_CLIENT)
 				CMD(execute_st, EXECUTE_SMD_TRANSITION);
+			CMD(nan_update_publish, UPDATE_NAN_PUBLISH);
 		}
 #undef CMD
 
@@ -17908,6 +17909,69 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 	return -ENOBUFS;
 }
 
+static int nl80211_nan_update_publish(struct sk_buff *skb,
+				      struct genl_info *info)
+{
+	struct cfg80211_registered_device *rdev = info->user_ptr[0];
+	struct wireless_dev *wdev = info->user_ptr[1];
+	struct nlattr *tb[NUM_NL80211_NAN_FUNC_ATTR];
+	struct nlattr *func_attr, *attr;
+	struct cfg80211_nan_update_publish params = {};
+	int rem, err;
+
+	if (wdev->iftype != NL80211_IFTYPE_NAN)
+		return -EOPNOTSUPP;
+
+	if (!wdev_running(wdev))
+		return -ENOTCONN;
+
+	if (wdev->wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_USERSPACE_DE) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NAN Discovery Engine is in userspace");
+		return -EOPNOTSUPP;
+	}
+
+	if (!info->attrs[NL80211_ATTR_COOKIE] ||
+	    !info->attrs[NL80211_ATTR_NAN_FUNC])
+		return -EINVAL;
+
+	params.cookie = nla_get_u64(info->attrs[NL80211_ATTR_COOKIE]);
+	if (!params.cookie) {
+		NL_SET_ERR_MSG_ATTR(info->extack,
+				    info->attrs[NL80211_ATTR_COOKIE],
+				    "NAN publish cookie must be non-zero");
+		return -EINVAL;
+	}
+
+	func_attr = info->attrs[NL80211_ATTR_NAN_FUNC];
+	nla_for_each_nested(attr, func_attr, rem) {
+		if (nla_type(attr) == NL80211_NAN_FUNC_SERVICE_INFO)
+			continue;
+
+		NL_SET_ERR_MSG_ATTR(info->extack, attr,
+				    "Only service-specific information can be updated");
+		return -EINVAL;
+	}
+
+	err = nla_parse_nested(tb, NL80211_NAN_FUNC_ATTR_MAX, func_attr,
+			       nl80211_nan_func_policy, info->extack);
+	if (err)
+		return err;
+
+	if (!tb[NL80211_NAN_FUNC_SERVICE_INFO]) {
+		NL_SET_ERR_MSG_ATTR(info->extack, func_attr,
+				    "Service-specific information is required");
+		return -EINVAL;
+	}
+
+	params.serv_spec_info =
+		nla_data(tb[NL80211_NAN_FUNC_SERVICE_INFO]);
+	params.serv_spec_info_len =
+		nla_len(tb[NL80211_NAN_FUNC_SERVICE_INFO]);
+
+	return rdev_nan_update_publish(rdev, wdev, &params);
+}
+
 static int nl80211_nan_del_func(struct sk_buff *skb,
 			       struct genl_info *info)
 {
@@ -22184,6 +22248,13 @@ static const struct genl_small_ops nl80211_small_ops[] = {
 		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP |
 					 NL80211_FLAG_CLEAR_SKB),
 	},
+	{
+		.cmd = NL80211_CMD_UPDATE_NAN_PUBLISH,
+		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
+		.doit = nl80211_nan_update_publish,
+		.flags = GENL_ADMIN_PERM,
+		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP),
+	},
 	{
 		.cmd = NL80211_CMD_DEL_NAN_FUNCTION,
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
diff --git a/net/wireless/rdev-ops.h b/net/wireless/rdev-ops.h
index 3e4e0d768ae5..5dd95091977e 100644
--- a/net/wireless/rdev-ops.h
+++ b/net/wireless/rdev-ops.h
@@ -1096,6 +1096,22 @@ rdev_add_nan_func(struct cfg80211_registered_device *rdev,
 	return ret;
 }
 
+static inline int
+rdev_nan_update_publish(struct cfg80211_registered_device *rdev,
+			struct wireless_dev *wdev,
+			const struct cfg80211_nan_update_publish *params)
+{
+	int ret;
+
+	trace_rdev_nan_update_publish(&rdev->wiphy, wdev, params);
+	if (rdev->ops->nan_update_publish)
+		ret = rdev->ops->nan_update_publish(&rdev->wiphy, wdev, params);
+	else
+		ret = -EOPNOTSUPP;
+	trace_rdev_return_int(&rdev->wiphy, ret);
+	return ret;
+}
+
 static inline void rdev_del_nan_func(struct cfg80211_registered_device *rdev,
 				    struct wireless_dev *wdev, u64 cookie)
 {
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index b7e1eaa061c8..0b0bef1e8cb7 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -2460,6 +2460,28 @@ TRACE_EVENT(rdev_add_nan_func,
 		  __entry->cookie)
 );
 
+TRACE_EVENT(rdev_nan_update_publish,
+	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev,
+		 const struct cfg80211_nan_update_publish *params),
+	TP_ARGS(wiphy, wdev, params),
+	TP_STRUCT__entry(
+		WIPHY_ENTRY
+		WDEV_ENTRY
+		__field(u64, cookie)
+		__field(u8, serv_spec_info_len)
+	),
+	TP_fast_assign(
+		WIPHY_ASSIGN;
+		WDEV_ASSIGN;
+		__entry->cookie = params->cookie;
+		__entry->serv_spec_info_len = params->serv_spec_info_len;
+	),
+	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
+		  ", cookie=%llu, ssi_len=%u",
+		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->cookie,
+		  __entry->serv_spec_info_len)
+);
+
 TRACE_EVENT(rdev_del_nan_func,
 	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev,
 		 u64 cookie),
-- 
2.34.1

