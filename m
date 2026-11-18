Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983816;
	b=095Rblr3aoZYbDzLvbo6oG+f3LegkoWsOCLwfupgAXShSfEV5vSs8vJFwgxgm1rlW9m3
	 ONJMeqDomN1q8T1YaIr40I4AlqDXbFlnYkBCZgGHvYEbpQPs3JcvVOh5CLnDMQioSEEfx
	 kDBtq2kUc98v8bllav0tszZlr8xxw86pFdNn9wBYKMjEsJ2YVqVL0sMd6fvm2vEl2m10e
	 6QENhfYvkuWpRwoOOOf6vFS/jauj3z3oAtKfwy9VvY+sVVO0YvaH4CMv69piDsPcZyYrX
	 ChcLsDpoVgPZ9QDXpHSXh4K1X82MSfX104SMvIkVEAY9tUiXOpmkCfMoLETah07h/rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QDYUglgswcA+rKL+bkjXrv3itTZLm+LTd0o9S5dIwWw=;
	b=AaGFeUcYMUaXr38APz22YApAnOAkOCGYfbeCZVu+skRkeJXLLjZ4bHeyLNhAW6zncvVZ
	 WzICV549JWll8S71yU9n7P1Qu6WhT74GDSCh7eMOefH/mcXCYo51xNnWyCw1YyPu7hWhw
	 LNcHqPU4qn+FA/ASt7AXYarx02A5aGTda/YPcrNpXnNJcpE7lzU0Max9IMKjGsoy00w53
	 7LJvPfa7dhsENMWyTMQ/m51KDnXdWprDWru3zrV2SrnpXD+rcuIvfPTLAr7NLdYOXweVK
	 Yr/Q8EdcdGc0lH9n0w/Wo+F5VS64A+aYfOXhcqprSYAGZKtvQkOCbHLt66XYY0OQgTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nihz4iw3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q98Ax2hb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267BD606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 267BD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nihz4iw3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q98Ax2hb
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3fN764123
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QDYUglgswcA
	+rKL+bkjXrv3itTZLm+LTd0o9S5dIwWw=; b=nihz4iw30BVaVvuC3J8MXP7CJGy
	RT4AOtJtbb4HWRL2Pb5qR+fQNtPQY7UWOsHm6cAxoElnxaF4o7KcY1VyWodm37hp
	t+XN4Pr6fsmxMJ4cciNRCy4zL7Iv5zIYGeu4uXZ8WOMenwNwaI+GOqWMiXHwJaoX
	oqiBs179cnXFHBMHP9K8NPmngxZaFPJM6nyq+zzryl/PH6pFVXsWbkzsvpTWULJl
	RdM7TTAj34iStBGpFfZrv9SAAKOjaQFZ9jcgiuhzJiexEp2swlTgdk6WWAwqXZCa
	BsYAJWJCXZW1fL/PzwqhNBvx9HWDrIDGavO6mpxzRbC4T3t/7P3eQXWrgXQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9ke7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3724667bc16so445588eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983815; x=1795588615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDYUglgswcA+rKL+bkjXrv3itTZLm+LTd0o9S5dIwWw=;
        b=Q98Ax2hblDuRyyj2t2db/2Q0aWzykDw3B4DZLzR5WJNgAkgicd7IMJeONYIbbUTp+c
         1IG4+Y9Q0eOX+pysJ/pV6d/VynRgDpMt/cxMvZvnGIhgbpeADybYIaGhCnlU+ZPY5fIJ
         3DhWEiZkT77t7GmlbyvUqFazl4Wjd1rctXlrBljzxMSKAAj7frJtnuGDb1n0aEkpRMjK
         901qeLLpxAHsYY4sccb5ORJ2UBOHiGSmgUFepcIdDNOFgdN/W8+LunzfwUb0rVeUxyJE
         dr9Sk1RYzH3tau61UGiD4mW0RijBML3XN6wA5fLj3BL2WsRZAWs80Lw4h9W+wveh/06Y
         LnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983815; x=1795588615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDYUglgswcA+rKL+bkjXrv3itTZLm+LTd0o9S5dIwWw=;
        b=D8fDkIYB+dh+5tSZs16S+rvqS/1kNrkW2uItDaHLH0iOvYqR4fsiYTY7wmZkmSNoi0
         QwHGWM1T/t5HCAeqyweYjoNRfVlNv6X8ceiAGNbW7Wx2Mgma5urp6gbAbfwIku7Sc1Zv
         3/qSUj3qZ7sfgGhZUWVq4Y4RzX5/LnXROUBxfE/ySGZOtN3h8zmmeNxxE04AX0/Q/+8R
         qp1bgFVd2/9emayL3EkfHypFdicYzlJ7MBzcDIigdcDWE4twuCa1NlFv49vJYnE3RyZL
         fFrQibH3xgyqhKgXsurLUKFdCTkWUCqJCEgZqYY5fx7WXfU3KSIpPaa0q2aMOOu4vp6F
         xrRg==
X-Gm-Message-State: APuU4Z9APct66OQcH2ItOanHM9HrgDgCPM5u7EtmhNXdSYRGfcb5Aibj
	kx7hqiOsKtY3l0xFmpwbIKQGc1eExlfcxflntOqfy7557bn5aagFcOJJnlXdGU2aK0EIggUtxxp
	ek9N67c70GbR8pjKeUEpsr6jDw8kz1pbERE/GteCgxBY3tLrbRWg6qcRFIayORvkYPS9KeA==
X-Gm-Gg: AZFdTZfF78b4ONTI87AvzAGXR4RX7hOAb1Jzl7vCZNKdubf+OqwwGBTKnUsnJdIcMFv
	1s7AdhZ1jKs4lsx0qAvkicPy3YD2O1mOnmf/VFrNvRKI+7LMjRTPumSxfARLzAjuo/JAAIpjL0b
	nKX20MaWQ7tUtmOl6ftTxrrFTFHpiyYFKFZHWVfXwhlBTTdlLNl91+x8b9F0nEYGKefnGrtDSu2
	lV9PUt2yka6nDil9BOl/16xZkB3DU60Ka0YGgg0OsyqG8rauo9T58muv1CcTLKj4k1pgxe7R35g
	zk1k5sI27vNIFotp3ZR822sr46b8y0DKh5/sZovoMm558PNMyOsfU3x4rM57pLTbWHrBRyWck1R
	IE8bnwpeoNpnuWduZebpZ2WjJyEr944EZUwwuMRmu49qIa5LihCPPdkQDmEjrWZw5kXFrmVCMxr
	7TMSfn/qzHhQ==
X-Received: by 2002:a05:7300:8283:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-3828161e0bfmr1542547eec.11.1794983814505;
        Tue, 17 Nov 2026 22:36:54 -0800 (PST)
X-Received: by 2002:a05:7300:8283:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-3828161e0bfmr1542526eec.11.1794983813880;
        Tue, 17 Nov 2026 22:36:53 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:53 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 16/19] wifi: nl80211/cfg80211: support updating an offloaded NAN publish function
Date: Wed, 18 Nov 2026 12:05:51 +0530
Message-Id: <20261118063554.2260397-17-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-GUID: B_jHylQS7hBo9WLc_-OsXjnvBrRyxEmW
X-Proofpoint-ORIG-GUID: B_jHylQS7hBo9WLc_-OsXjnvBrRyxEmW
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd4787 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=grxfuFoILc7gH7VXXwgA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX68KTJlcDgo7f
 UPeHvhVZ+gxp7Nyv9ovwQY6EORSdIWZufm8eDKxcOeJTNMG8eg1ZwrvVvTUQqPxlyqshIFIKe5h
 tntignbXVQqTstwJ9fXiXqwEWNH6beU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX5XEl5Lq7U3rY
 NA5Dp7TRMQVx22nxTAGXtsVBnH4ym0uj1CVFwsRH3m4MeSfJG3nR/9D7iNz+cvNOMQc1UVtc/Sb
 tmdr5evCELCHUrYQ95Dvu6ANABkLiFJ5ixPOmzqLA3A5PGp4clxhs2RmFADao+9mWD2ldNSUawx
 LvpYXTKeIhATKEy40TdcVMcZBpd/7Q9Yx0xcZZeVS4cPYTYLjKwUbGp/cSxFpQM4yN7a3ox/cIH
 9HVUDJqiDTJDJ86N8DQLY8jPr7iuH9uKiFKQ9OYxCi7fUmUMBf05z4kbKDPJbvIUlaSeMzfB58p
 GCWtHDIUWwWtm71vkHInNizhBZihLn1Q6YXa7dZnvrd/+O7mf6oEQn3S3ZeCgDr7G3xwu5tNWts
 gZ05ER1twO7IOtWj6qOCTA0cEOvPCvpXU9g+eMYmKDRyzfcMeNE3MlgwtGOGNsIOCog8v2pbfYi
 7h/Z8RBMejPAgVzoWzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

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
 include/uapi/linux/nl80211.h |  8 +++++
 net/wireless/nl80211.c       | 70 ++++++++++++++++++++++++++++++++++++
 net/wireless/rdev-ops.h      | 16 +++++++++
 net/wireless/trace.h         | 22 ++++++++++++
 5 files changed, 139 insertions(+)

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
index f32ae55797a5..137ee621dd56 100644
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
@@ -22184,6 +22248,12 @@ static const struct genl_small_ops nl80211_small_ops[] = {
 		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP |
 					 NL80211_FLAG_CLEAR_SKB),
 	},
+	{
+		.cmd = NL80211_CMD_UPDATE_NAN_PUBLISH,
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

