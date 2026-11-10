Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285219;
	b=hHpWI+V0lJpSpe741+lTfHSiTh3lXq8c4p0OYMloZt8HtIcGn8u1mKo4RAVW+UTm0YSY
	 cAijI6MG7NcLgRcJbHXRgiWfq2zG9RCTOg+aDfXY83tdT7fD4wqRcdnVmSTBr5iGwumRu
	 Y+ELqVfa4S/js4rRkcSuHu9//dVqLUBOBGdEbFnVq8zKfWtuCBwv5A8UjdYQXzFkqvDHV
	 Gvncgju03zpGZN7GcquwAi6uf2fYmbdrj4kNRN1ndoXA3Xj4GnHcq38gDls5kwgBnSK95
	 BkDhki2CAqd9AjSU6CK8h+TJyXYrMY7+TgzRyjRCo6eHsOAkII4rRSaTwlV79IK2gPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/UgD+Dy+eWEHSD42uQcJpB3nIDq51QMTd5AG0oj2YdI=;
	b=k+rCpqyKuyjp4oxNEumxv4yER9W2W+G5lEltTy5wC51fqVsafUfFQIrkx2uykGxXsh3Y
	 YJUfKkOgZPsBlnYrMtX30+OywQ71CHiuqJPR8csqQbPXFcZzwPneRmaP9op2ou7/1XVMP
	 ZZ8EAryIWrNtmMwGpK0NLsol3Q6z1pFDzczHXS/bzqhytwrhEyqdFcAKd6tKf8ws3b+g5
	 8N9u04D2B+vtA5n/wrRuLdR7wxLiIfZHZWJHprBql5YB6h5OfNhuz2VEsSsdLiaraz56O
	 Spf5Dg/YVbMDSSHvG+F6o1TLRQ4hox2xDHfXMxgorI0G2MMNlRYPl89Vz/+6kMnioGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A0K+O9Zq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LsBW6V3z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA1E606A331
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA1E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A0K+O9Zq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LsBW6V3z
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ACdo1768228
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/UgD+Dy+eWE
	HSD42uQcJpB3nIDq51QMTd5AG0oj2YdI=; b=A0K+O9ZqeMldPxvwGsetbbUJ9c6
	C3cmVvm/dfj9zWPvpNqWc+ExB+zP1tJMPl23MEhyHhokO1zJpLl18Q8hmY2pkV8e
	ZcpMmjUunhkPHePneZlqcr+8RmN9oAGSe/x7MGJz5rRkMkJBO42VOP90XKqH3ZZL
	YT0VDQ0uD8bcoDQSKPqNLtqDkCuYI0RvjgSDrXwxwo0Bjkccb3nrTV53xRT2SL+9
	knTWNHE+if+Q342IJC6o2hvO+iQn0BSiOKmJpmCWz6cn7LWxFjLdr4QqTlHHzfcc
	+M8su7m7qptDHYhByo3eP2grp5icP14j7j55CYVeh4kDbuG1SsPMso5BmgA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp06uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36efb506f29so750193eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285217; x=1794890017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/UgD+Dy+eWEHSD42uQcJpB3nIDq51QMTd5AG0oj2YdI=;
        b=LsBW6V3zuxMiUdj6rkb6XTX9MF2dbrCFt+qEf5yMVPVOGOSahlGdJZ1UbC7La+oYuy
         2OxYsOPEeamNl9nc/AlPmdK56/OyXuvK3wq6QTv2frK46WvkKUwQNxsPI7zlIpaj+tvR
         ss7wAe1thoT1oo+aiHE/du8Nv1BnbW6FpsXxBBPNS+w6NBE56bIcLE2TV9G9drpAXt+1
         gBaZuy6afNGppUyRusPBkXiXi0cOthndr0RWQDy/300w8gZPd4HjHcnw/YULXMEFxFzC
         gSYeUOma0NrNPirK4hxMCUlEKSxoTjAFTQZA9W/GIwIuGGPmWobGbGOiyYzDZmvroOo5
         wG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285217; x=1794890017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/UgD+Dy+eWEHSD42uQcJpB3nIDq51QMTd5AG0oj2YdI=;
        b=R1ehtIccYKPUOhUJqKb2rgcHJ1Sac0PktOQz+CJe51mhzvi+Nj9IZgxkPKZXk/zQBN
         EY1kblP81/RvmLMQG3RU43chpLJgeKqLbwYT/AMnPFtn0ZPuwAByYEqVLGgCIEvMkiVY
         +4s84ugNPlRnxl00uU+ekJEO4hKDpwH6U1Sk1UIyPjAo0aqqUqhYHVKtuYcD2dkCWOrW
         8c1RP5gHfcBdiW4SY++cHA99bBsKYTnMKFVRAPilUreo7RT8iPcR4zW1z/LmFR2B65ls
         3Mk1JryZDOmav4mOcIzIptWi7GZQsgmCi7MawDoMvcyJUwTdg4cUA8HxrAsGGRVqTpF/
         7J0w==
X-Gm-Message-State: APuU4Z+zbka6jdWRrPgFMoQ+cljyThtMGJeGxLXyJlVGnK1TYMUYz0YQ
	7ELOur9Mke97HGSNIOvnyUzY2T5i5DwNmd+yvC7KrDIh1b2YDF1CT9kgUJXbQV+VTZ5tNeaLeFt
	BdwyRBO3levXgkuFtq/d8aw0NOoY1ISdCVflaMAjSAjct6vd4j8HdrWXynetQEjgzsKcnrA==
X-Gm-Gg: AYBFou1Be1nfpi7xZcOufArjn4YtRo/MPHfgzN3rOUvAEo4vTSSO0XNefP7h/yZnAmk
	3i/zIFFFB8GnqjyRz3G26NA0nevsRckkw5jCTYFki815s7dsT45/o5dEki0qWNBt5sVdplLDbK1
	o02P2wH5LWWwdiyuqR5wuLATRcwAgvQE38t/tYOmEOhzoVqoij3qKaRXPOLoMBmf9QDLLUprDcN
	o5XoOOMds1lhb5M2AtET6DwUpNwiVqmYa19AaKrpQqrkX4uUh7x0Cm/6OzN8OF/Jg/9nMMVqRND
	m5NogHz56/px6qRGXqfNk1AvOfNUFSCRf0lxJhTpwewc3EcjhzOC7ckUxDP4J6waruZvKIg8npc
	Q8GPJ5o0CMs94IqO7yL4R8NWFKi+b3iaomODCHANzs0oEICZI9Q1jclV5S5cXYr8XS2AIyuWvEZ
	K7lUfesIWHsA==
X-Received: by 2002:a05:693c:80ce:b0:372:1be6:110b with SMTP id 5a478bee46e88-3751f0780d9mr1609578eec.15.1794285216658;
        Mon, 09 Nov 2026 20:33:36 -0800 (PST)
X-Received: by 2002:a05:693c:80ce:b0:372:1be6:110b with SMTP id 5a478bee46e88-3751f0780d9mr1609548eec.15.1794285215960;
        Mon, 09 Nov 2026 20:33:35 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:35 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 16/19] wifi: nl80211/cfg80211: support updating an offloaded NAN publish function
Date: Tue, 10 Nov 2026 10:02:39 +0530
Message-Id: <20261110043242.2012238-17-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 7vXYwrs5SyjW2OCiiStrzTiWB7ZTQwkQ
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af29ea1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=aBxYrPyN7Ze1QBbtAQoA:9 a=O8hF6Hzn-FEA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfXzIflPfR0a5va
 sHBeZF0+bqWX1gsshKIjNTM8ic8wGh+H/Sp8LluTfu7GMZtSaZawXED/nNJcM+M+zylcNCWQRL8
 4rzvnQVeAQO9ztq1VAYrMgkqlU731VdSEciKCc46/G61Fr5vjpch19rckFwMOZrQytjyR5HmVay
 cOh6ALJma0ZJFD4ySSVBd3JD8+nK8YtCR+m7S46htXjzS18OZJnPQq9vVl+2xwEpIr6QXbWw33U
 G7GX+7CJzc75xWyOLDkKHbiyxaEibJ17lxnbp6263cZ1mJVNDdscUhNGcXQ06zVOGempQv4pgKU
 YvaMAX7bx2b+pGm6B6G6VmcxvKntJzneB3ruSml5kSCDYAbOupnjWoQkUuKeU2sdAgC5Kj69oPk
 bsCb9dzZDV25SvGg5Pa1ZXqvLxg8GHvpgyxXDkFcZ7SexvSEN0iS+blc9FUtoMXe+ZwrCiovieZ
 c6by/FUW3pWNGdTveHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX+LEaz7pXncXa
 NpobLyvLuYA7rpqSHto++uie4bifD0Agysh1SmsmJ/75U8ND5LCbR5tls1Cyf5craJcGXQ/KP7s
 bcCL5CVSrb1NAuWSBMEhlz2t8hhbnZg=
X-Proofpoint-GUID: 7vXYwrs5SyjW2OCiiStrzTiWB7ZTQwkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100017

From: Vinay Gannevaram <vganneva@qti.qualcomm.com>

With an offloaded NAN Discovery Engine, user space may need to change
the service specific information of an active publish function.

Allow NL80211_CMD_ADD_NAN_FUNCTION to update an existing publish
function: if NL80211_ATTR_COOKIE is included, the function identified by
the cookie and by NL80211_NAN_FUNC_INSTANCE_ID is updated with the
complete function definition from the request. cfg80211 keeps the given
cookie instead of assigning a new one and passes the instance ID to the
driver, which replaces the existing function. The reply carries the same
cookie and instance ID.

Signed-off-by: Vinay Gannevaram <vganneva@qti.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 10 ++++++++--
 include/uapi/linux/nl80211.h |  5 +++++
 net/mac80211/cfg.c           |  4 ++++
 net/wireless/nl80211.c       | 24 +++++++++++++++++++++++-
 4 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 634dffbc2ed1..1216bc5a183e 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4610,8 +4610,11 @@ struct cfg80211_nan_func_filter {
  * @tx_filters: filters that should be transmitted in the SDF.
  * @num_rx_filters: length of &rx_filters.
  * @num_tx_filters: length of &tx_filters.
- * @instance_id: driver allocated id of the function.
- * @cookie: unique NAN function identifier.
+ * @instance_id: driver allocated id of the function. For an update of an
+ *	existing publish function (see %NL80211_CMD_ADD_NAN_FUNCTION), the
+ *	instance ID of that function.
+ * @cookie: unique NAN function identifier. For an update, the cookie of the
+ *	function that is updated.
  * @data_path_required: if true, the SDEA Data Path Required bit is set.
  * @security_required: if true, the SDEA Security Required bit is set. Requires
  *	@data_path_required and %NL80211_EXT_FEATURE_SECURE_NAN.
@@ -5506,6 +5509,9 @@ struct mgmt_frame_regs {
  *	cfg80211_free_nan_func().
  *	On success the driver should assign an instance_id in the
  *	provided @nan_func.
+ *	If @nan_func->instance_id is set, the request updates the existing
+ *	publish function with that instance ID and @nan_func->cookie, and the
+ *	driver replaces that function with @nan_func.
  * @del_nan_func: Delete a NAN function.
  * @nan_change_conf: changes NAN configuration. The changed parameters must
  *	be specified in @changes (using &enum cfg80211_nan_conf_changes);
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 1901d0dc86d0..9a149db238ec 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1113,6 +1113,11 @@
  *	returns, so userspace shouldn't process NAN events until it processes
  *	the response to this command.
  *	Look at %NL80211_ATTR_SOCKET_OWNER as well.
+ *	If %NL80211_ATTR_COOKIE is included, the command updates the existing
+ *	publish function identified by the cookie and by
+ *	%NL80211_NAN_FUNC_INSTANCE_ID in %NL80211_ATTR_NAN_FUNC, e.g., to change
+ *	the service specific information. The request carries the complete
+ *	function definition and the function keeps its cookie and instance ID.
  * @NL80211_CMD_DEL_NAN_FUNCTION: Delete a NAN function by cookie.
  *	This command is also used as a notification sent when a NAN function is
  *	terminated. This will contain a %NL80211_ATTR_NAN_FUNC_INST_ID
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 6e466f8e1653..8b399d7829d8 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -506,6 +506,10 @@ static int ieee80211_add_nan_func(struct wiphy *wiphy,
 	if (WARN_ON(wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_USERSPACE_DE))
 		return -EOPNOTSUPP;
 
+	/* mac80211 allocates the instance IDs and does not support updates */
+	if (nan_func->instance_id)
+		return -EOPNOTSUPP;
+
 	spin_lock_bh(&sdata->u.nan.de.func_lock);
 
 	ret = idr_alloc(&sdata->u.nan.de.function_inst_ids,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index b781e71979d0..15c2294d4be6 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -17511,6 +17511,7 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 	struct sk_buff *msg = NULL;
 	void *hdr = NULL;
 	int err = 0;
+	bool update;
 
 	if (wdev->iftype != NL80211_IFTYPE_NAN)
 		return -EOPNOTSUPP;
@@ -17538,7 +17539,14 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 	if (!func)
 		return -ENOMEM;
 
-	func->cookie = cfg80211_assign_cookie(rdev);
+	/* A cookie identifies an existing publish function that is updated
+	 * with the function definition from this request.
+	 */
+	update = !!info->attrs[NL80211_ATTR_COOKIE];
+	if (update)
+		func->cookie = nla_get_u64(info->attrs[NL80211_ATTR_COOKIE]);
+	else
+		func->cookie = cfg80211_assign_cookie(rdev);
 
 	if (!tb[NL80211_NAN_FUNC_TYPE]) {
 		err = -EINVAL;
@@ -17548,6 +17556,20 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 
 	func->type = nla_get_u8(tb[NL80211_NAN_FUNC_TYPE]);
 
+	if (update) {
+		if (func->type != NL80211_NAN_FUNC_PUBLISH || !func->cookie ||
+		    !tb[NL80211_NAN_FUNC_INSTANCE_ID] ||
+		    !nla_get_u8(tb[NL80211_NAN_FUNC_INSTANCE_ID])) {
+			NL_SET_ERR_MSG(info->extack,
+				       "NAN function update requires a publish function, a cookie and an instance ID");
+			err = -EINVAL;
+			goto out;
+		}
+
+		func->instance_id =
+			nla_get_u8(tb[NL80211_NAN_FUNC_INSTANCE_ID]);
+	}
+
 	if (!tb[NL80211_NAN_FUNC_SERVICE_ID]) {
 		err = -EINVAL;
 		goto out;
-- 
2.34.1

