Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285184;
	b=C9utKHMwLgaCEcX3DLWP/X7PYg5vmhjJAdLkeuSZlAf8RE5swku3XRZYBpsbsedcLIUS
	 FoglbCxiuGWi45IKBxfwNXozcpq8PawMj7UJO303zndcmfrXm4Yn1woc/elc4Ob2NyQc/
	 LOY4cXXjvD1ojS7cICuZY/tuXukF0Ny68taIAKMTVLOmHrTfzxnJLfL2dXSthAn8iEEYS
	 mKrZzfFxekJMpoE1dciUFZNKVMM5gE/mYdXr+0hbiGkFbjZd8F6ClRBLD42EbTivhwV78
	 /RokAyFCOmLKtDqZrDaQXnXG+WbRmVL2GtzJZ4VDipg4Xmk3SSEoGD7UK9y+2MFBQZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ETTgqvJCp6Ulnpwf8T9IsgqibR/2p1EE46WlEyo6J7s=;
	b=knX0eaJDFNKFJcd2RBKQ6/7puit6GXlsprQdLMJvM8v13n4wbT/yupBtY+qf5rujUjjb
	 sq9tFRRbwJoGNcnRLyIg43vvsC71IN7qb+fN7jVhA9AM0dGE+b4VemPrjqaSBGpPI2Zsl
	 tjEGpUA8ac9jhXg4EwZHACcAObmPkwB1e1yju1FBRQHThHej3OtzQS6Y2MLQAZVII59/S
	 fL6iVOTdDdw5YwXkm20woPQLEnlnRthNK+aW5XTCclfapP+STKRrfXXG7NTbj7Bz3jGsg
	 p9ZFeYCZLvKmRnGAeLqtQJOWJpXSISOnMELKiVFwc8a+4Fith9fmVVPq8nbaAPvilMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P649l+oe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="iuJ6QO9/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9BD60A2625
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C9BD60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P649l+oe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iuJ6QO9/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A5H22297861
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ETTgqvJCp6U
	lnpwf8T9IsgqibR/2p1EE46WlEyo6J7s=; b=P649l+oe1eXCugKTC6Ar2CBrqxF
	CHQ20g9RDjTIENimss/alXhT15E2DFpDE5WKIDl7NnWMx/dX0nwjUteBGSTxvnYg
	k6EG79BbEbfJ+vVhg4sEcSsi/jJmOlr084nAEhrJBZFr44S69FIsJiEFRjfurNMK
	BdIs7ZyFh/5vkxoI2S6FUERp3uHNj+pr98sQiuCKiHh+F+6GvJpuuE/Z5O+9oKV8
	jp9ckHxkKw8rOpfdtdde1RummSOuaEhqUxGIazE0fUyZ881lQSF/pAC/JXd8doNp
	MlA7VDRrTHccLkiKFHlFvoydfGmiHiv08ClVRYIwKa5AHW9M3l4c6JJ7dyg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2mxk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso2290451eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285182; x=1794889982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETTgqvJCp6Ulnpwf8T9IsgqibR/2p1EE46WlEyo6J7s=;
        b=iuJ6QO9/cwwhHFRkL+9BpWoKfKB9Q6200pvZPH7UDxszy6Oy9OkStx+IAMFtogtcFd
         zbTJtqYa46TMBWYKMyjeWX80u/ceWTlGFJdOT1LIsZBIUaXDn8xQllC0IFLTEuDiAbPU
         TE27iCwdh8KgJxiOCrYzsMw1BSip9fFiBuew/XKX6/x9J0Dg7Pucs3PdbBN1KOGuW8Wu
         diDiLKbJtgEbk+x6BKsno+P4b3gX3Mm8UR49ocvOsmEEztR9Wfkg7hNHlStGtflPNsK9
         EjgSB3QogDeJskQZchUKcK/ednm9K2e6nnGqFm5TUgpRQY7GjFyZmScXNBvImlyCzvj+
         bu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285182; x=1794889982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ETTgqvJCp6Ulnpwf8T9IsgqibR/2p1EE46WlEyo6J7s=;
        b=vLNjgnG9cAtQo81e2o1A2XzB4wgF0xlxkMupKD/71f8j2BCfj01+U7rdlCkjgYQD7v
         xBqq0o7hwqHcpyzUT7NUWza62ckXHpyl8AuzHpcWLjzRYIhvhGJV/qVVl3pcIGpUVusL
         Yj94xPIY1NtMUnQ8anspLzc74oAQOiJcat4yyT/mZ2Alkyz7dcRqjgmZbbzqPlZlmjPS
         73YlQnRKv8eX6vNXJqWZb5UeXr+3G1xYv7Qq7+QLewwcBbI7Yb9NFVfbylshda4P2ZuC
         Wt9yYTGu91B6shTjO9csk6fJAgkmEoZ5X9W9OaBFTsUc+JQ0EkiSZn0mcMSCqTJhBwxE
         s0Sg==
X-Gm-Message-State: APuU4Z9u7Dsy9zqjtNMy/IQdTKszzpEf52Ic7EGUaDgPWIrZTQ0TvJF9
	Au5hegPdrRsTVFgTcSryngRA0gpB+OoSerEHew1oJbwEsrb8aPlw0cl9ZTvH+WxbMgj3NPxBtFg
	qFWj1eyQjl9hDehQID1i5cg2PIuWaMPnaJBUR0KDGzFNnqlDdL0nc9zK0bngF2n7qg/eg/w==
X-Gm-Gg: AYBFou1PEDdwkgx4ayBv/7kBjS37yOtDIlVA2+86X1hg2SdghD/kCil2epyblaILbnn
	gRD9lwAwDAVufNda/n6UUGqPCFPaLnN0b3oXc93A0pP4Is47mPDuHe1xXEUtkrgV7+uaHWNJQ2a
	/v2qVOON4D2gTaINpcl5EblAleL9pD1rMTSj9JEhi5k6AqH4cuao2zYgx3ICSAkcc4Jj2jYEcKM
	JCiXootDK41/NcNWWAI7qez/nUKD0ZV1oToSzVRKD2qyZSpR1bVFBHJ9o8gJoAy7Gq1cKErQo4u
	MXzaXL3NAEvwkD6BToTaMF80/Zgy2DzcIAdopZcjuDy+iWMdvNxs8avfUmwZyMeww2UWMY4gUUk
	qEB4s2w8Z+tOx2yNHTE722eHf1jwPmFeZKaXkDH8lXZ9oMlFCMTyK/N3ICSnrYN11LLXh2VpWa4
	iFd9C8/hiw7Q==
X-Received: by 2002:a05:7022:e884:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b3b6046680mr2282563c88.41.1794285181982;
        Mon, 09 Nov 2026 20:33:01 -0800 (PST)
X-Received: by 2002:a05:7022:e884:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b3b6046680mr2282522c88.41.1794285181315;
        Mon, 09 Nov 2026 20:33:01 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:01 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 01/19] wifi: nl80211: reject NAN function add/delete when Discovery Engine is in userspace
Date: Tue, 10 Nov 2026 10:02:24 +0530
Message-Id: <20261110043242.2012238-2-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af29e7f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=LdyAoAVN-_wWoD_69XAA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX6XQACQHijHDa
 5lbbNKsh/JAkfuAcFaw/nzHjIa/37ksxdYwkJ6wmT62MgAIvWuByah646EZKNYEHzN97hakVqcA
 FlXwa8LRbw5ElvI6po5OM5b/ErC+eI5cOx5uc1yf4mpxBWqKjn8+/SKsIkiufSRn68bbQLmISl5
 23GFSLK+GeVsiYSlroE2/IimUUWISfdFALAArgyxZB3w2Iz8JeHnFdK1enMNw9lC4oXksP9G+0I
 UvNJkqx49N51UsyuTh+AFr6j3JwO74vu6VpTxt8t2xht7OV9d+QCMa3sMeHHiWmbr99fNvsY0pV
 6Gh6gmg0auvch4cFy7x6Sl0TVNvwJb0JXbpcHrDC7Cu1HZUItX7xi/tlGuq+BSdFx9JcOCktTXq
 cy9WmVymbPRNWy6oes54fKZe/CA8MamvRr0KNLhve5Wb5jOSrHhqAKORl9ZcTGSJ8Q4fcD5u3SF
 3wT2FYLFWk6Vfajdq1A==
X-Proofpoint-GUID: zRfXYHCes0MVBcrb1KR98gDxhUPPRauf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX+EZH6m4NLqDK
 FSPxO6JbwNgno1/vC/sMxcATmEjeq1tqApjTPPsYjWRLMkstkYmlDcYVNFK8pN/xcg66c5IL/Ty
 7vrwgvgl8S8pZUSjZlMcrqeNR7Z5BmY=
X-Proofpoint-ORIG-GUID: zRfXYHCes0MVBcrb1KR98gDxhUPPRauf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100017

If the driver advertises WIPHY_NAN_FLAGS_USERSPACE_DE, the NAN Discovery
Engine is not offloaded to the driver. Reject the request to add/delete a
NAN function in cfg80211.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 net/wireless/nl80211.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 2fc680382418..858baaff9db9 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -17400,6 +17400,12 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
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
 
@@ -17633,6 +17639,12 @@ static int nl80211_nan_del_func(struct sk_buff *skb,
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

