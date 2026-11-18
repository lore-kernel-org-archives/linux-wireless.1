Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983778;
	b=iynzX/EC/jAwvKnuGdmhHJj5ZJpX52n1z0a3X0fL/YCrkZ5LuEYyHN5atb/Pu3zzvz20
	 aJuyjNV0Tllvo0sIWNdG5TOnt+La4eOTMF1onWBjQ/uxMs7j8VRRgneSzAQHyx5dxbYQe
	 DuW+hvCGq3z58JUQS8A07324okU8kfdwKgg03pWlO3fc8UHUOEvTh5kz5Oq3Pd/ri8iTB
	 TM4MKTcBYJEYLG6tyPEExTnELdvFo2sv4/3i5YnykhyzmjzWqFGZP7B5jYDcTIGs6uJt9
	 ehmzX9kAI8JaaqzOypQmr9UTHT5T9bpZbR8pP7CfL9+6/Se47cI7haq/xCnfKM8gZvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1DRtXtdINJrqED37R4vJVlSrtHY+/7gPks8tcJkqPI4=;
	b=rk4UkaaGSca1SGWKKFu7KGBGg6rBfWb8d85yNkIXc0LXSRoiidCuAg/3qrLNzW//elPE
	 ELuNmwcIQG3DIz8/P/hl7Y5Zqf+qAsSa2TePU1Ouod6xIStRfO8d60nPmZ/6chUmMmCwT
	 qpNyVOljcCeCfUARXrNBvrtd3P8dx47NPfI9cwEMYrVAvb07kOB0K6T7PDRfvMVm7fIoJ
	 wkSOOAFpRRA9G7BBXzU9N8Oxl8p/0kvLbnwPjuUpr+k9bSfrotNtP+WIMus47eNGgwOof
	 h6+Ec0ye8lzkZ2uLCNEcrKbn+VQqZ05S+lbXymcMPvX6pYZQRdrPgWgbQm+62+/Sm+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WuBngVRv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JrJeQzVk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E00C606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E00C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WuBngVRv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JrJeQzVk
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V5jr764264
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1DRtXtdINJr
	qED37R4vJVlSrtHY+/7gPks8tcJkqPI4=; b=WuBngVRvAqy6hJoOk1DL+O040Vv
	GnV744FeNYVOZ+KRSOHHoTb7yKwW3LhZ2TDYYMLeIIl72q1YPhfwBv5ch4NXCnm6
	Jddj8gLnKc1Z5s69FUrtHTOj0vGlkEOCn/5iEloFojNWq7zWFCKVjwXgXA1rIiE6
	wPcxRBlUe/VA22dckHESvk5wHJ+uEJvCWRYzQImL4uUK1xtw7+PCaVObXtxDqA5f
	vPoYjZ4jHAJcmwOfGdfkV/F9s+4r2JL4RBqw5dGVXVc/z8F/6xO7o5zQPK6DBBwn
	4r+PVyag8yzO2KDMyZDZ/LtSTKf+7fuGO2hOkLsMXKr5ymqDUoSeQ1+xeHQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9k81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383435e46f9so40881eec.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983777; x=1795588577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DRtXtdINJrqED37R4vJVlSrtHY+/7gPks8tcJkqPI4=;
        b=JrJeQzVkirOAzRVIoL+VrKEi95sRmKMYM2Xvebrkea/M6jYWs/+LYYWABEz6baLMwD
         teJJdIN/lAt/1nV1N9ZvUQL16v8rJjp+GGXcRbSKzvOo1SBWugN7jjZ0gFdz0+JO1OQO
         5SJ2R943PLxSjPU/dytjuwImimwswxSoSGGUBNu8ZL+zCtTnOkk4eiS/wSXmlvf+c5h4
         kN2TpudeAd1TnIhOEwIK95tvLAHzA7nr098Rq3m6WGSUKHEyZb+zXFj03ellHVHUettq
         dR0aWqIafG3WHkZFFMjSy+EPvVWoO+n3nRXRoJAoLJQgb1X6xe+juk8b8u37e6xm5x39
         XqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983777; x=1795588577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DRtXtdINJrqED37R4vJVlSrtHY+/7gPks8tcJkqPI4=;
        b=cseEB3OgcDflV4kmLOMcUYXulrvzhB+/oE6OEIJvj2cd7nbB8wkcw3JDWs7N1Cl0B1
         boN94kCWDzPX4GoQhhlQtabOnWS/gSMmaw6sgmEQXLwkXik/tscY0KRCQXIOqt/ndb0z
         mVIdtt/82I4rnV61qPLyFjKaD/xXs6dQy3RRu0En0lzI2APq+GdJbf8BwH7lJYIIsnx4
         6lMLtii5qsOfhbG4IOeDeDVTCPtpzepvlmEhl4swYwWgn7eBfxzqDpJMsKeq7OzH+Qe7
         +Rp7XxHO1m6Wt+RcEBwyjNznQMVN7Rra4QswNTr05ST+s0rZNv3Ia4sXoj8ACPO6CjSG
         UOvA==
X-Gm-Message-State: APuU4Z/Dpo0r+asp9ggZvLHEEeJlTC28/A/CDjSGm7Su3ProoyTtE1mX
	jDhVtpsQmnM6o7qcjqsC4QxbflwE3uyZTA2UFHwHDCs91QI6RCvK/TLPdJJST63GPlo9SgCXVvr
	mtY11RWM3Ty2OGre9zCWVJZCrq66tuoxWGf1ivk8GeuB0bpZoWJgZg2D8lL2IaStSQ61+xA==
X-Gm-Gg: AZFdTZecTDyWdcdjLgPJQP5TFyJQLFQ0CbEcJFAlfjvvzAZaa79aQaSMPW19KBnOvbr
	GVqgjvxOCYaCdTXecbQn0BOfLw+H7jMpNZejiJyG06EovXOJOoxKmXr5pilF1gvmxe0WPSASVXE
	+8T1WXuDFqWxsOIMS51hv8EPyX3sU7+tYcXYydNGvIK63DKNllvURNTO9VS4EfsCU/nzTyjVkxX
	lc3KjvtY6K5SvWI7BcnwGu1ZO6YNGY5Aq5TaFLtb8824H/o1oxLQQLaM3wAX0Mg3bU7tvFnVyrh
	9HCGcAphtas271pG88Dph9sNdtLzxZvpg56nw3a/OdrXvCm8SzL5Klj6dgO/i1GVxH2C3p7u9ld
	eBxAdd4me7yAZoVS0D7CsiNa6QAtf+y5eWCMXf2KCJja/V8MN6ZDAuQQONne5HeTPioCmeX1IA6
	/rJ7rF2Hoo3g==
X-Received: by 2002:a05:693c:41c2:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3828101fdc8mr1474807eec.10.1794983776605;
        Tue, 17 Nov 2026 22:36:16 -0800 (PST)
X-Received: by 2002:a05:693c:41c2:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3828101fdc8mr1474786eec.10.1794983775944;
        Tue, 17 Nov 2026 22:36:15 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:15 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 01/19] wifi: nl80211: reject NAN function add/delete when Discovery Engine is in userspace
Date: Wed, 18 Nov 2026 12:05:36 +0530
Message-Id: <20261118063554.2260397-2-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-GUID: QsqfHYO9okXFCmDg5kC84wZjcvHBRPPz
X-Proofpoint-ORIG-GUID: QsqfHYO9okXFCmDg5kC84wZjcvHBRPPz
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd4761 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=LdyAoAVN-_wWoD_69XAA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX22J7gRkpoJ0y
 X9t1/kOksv4R3LeJCotutWH6s9RPufyMts5AI0jvsPo5qMYHqlMDgRNNklKD1/wKKzNlPnyY6rr
 jogw0DeHbLD4jQa0g8FSgxb3AjzHmbI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX1haaugP1P0Xr
 /2+BF6J1OpGr1C+0l8heMT4IoRZOqVXt4dtMNoBvmJBFIz/ztiCmLT+xVf/1jOIFIeVSQxKKUiM
 N7EurjE2LIWn5m8VFxudfJwYW6FYM7OPmYtXreuZfQohmIoviOE9HRXLsCRXG0x7tU11DFkjjWn
 wI+3NRJz+gAqhjmiPlzt9knqdax7ba9w8sn+Z86d2gYTfRd3ggTdOlTFBZlExf+pk6OyPtRilOP
 vkgKfKuHgLBSaKlP2b8a1Un5GR8Cxx/xaEEci10V9slDG00fPyWu0Jfog9qODVpEYcw7uBEIWbq
 ++d/jThGJpbukq5JBQ3cag188rIXtYgO2fjH0Bf2hJsZS3wWG63GNJRzAmq8XRfNhmt7U9w6OlA
 HaBWBEPzYOA3H2EwLEexU2pZZvm4RbZtPF4o4RA51T7VmXhJnwhOVupl7nvvnjcwULvB8TlMdHW
 4YborR3dZp5dNCj4EbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

If the driver advertises WIPHY_NAN_FLAGS_USERSPACE_DE, the NAN Discovery
Engine is not offloaded to the driver. Reject the request to add/delete a
NAN function in cfg80211.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 net/wireless/nl80211.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 5189366809db..5df058b835db 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -17419,6 +17419,12 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 	if (!wdev_running(wdev))
 		return -ENOTCONN;
 
+	if (wdev->wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_USERSPACE_DE) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NAN Discovery Engine is in userspace");
+		return -EOPNOTSUPP;
+	}
+
 	if (!info->attrs[NL80211_ATTR_NAN_FUNC])
 		return -EINVAL;
 
@@ -17652,6 +17658,12 @@ static int nl80211_nan_del_func(struct sk_buff *skb,
 	if (!wdev_running(wdev))
 		return -ENOTCONN;
 
+	if (wdev->wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_USERSPACE_DE) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NAN Discovery Engine is in userspace");
+		return -EOPNOTSUPP;
+	}
+
 	if (!info->attrs[NL80211_ATTR_COOKIE])
 		return -EINVAL;
 
-- 
2.34.1

