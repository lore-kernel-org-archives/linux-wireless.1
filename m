Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329900;
	b=atwj/zQ4cqT3kmo6NizrY606AA2VQXmJTsbPYgk6+Eo2bRDXLH4OyPSFpArdNKJvhu5w
	 44pQZgiAe3osw1tlvY13X/eGBGqvlF+0nDLNAQENKk7op40VC7QPdHHHCO2awDOD1GxLI
	 aS5AtOv2IbWesJEtVfZUFFZKJxzqfTmlKa5AypMznP1ecnbs0hql4JZfaH6W9iKqfr3LB
	 PB2uItSIezcf5w2cGfUOdWXxZp+U5HusvxIjQkuukPEytG8f2/I+dJJv3i0JZsrmfJouw
	 bO78VU1YSw9m57t7BYunS8DtLEfZHRfFvhHe0TgWMhKe+a1Lp9h4nJHkenE6TjYCx8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GpzaCOPWKr8MEv3LeEfjo0nrqvFeRqzQgqVyaw5fr7M=;
	b=2NMJJnX8HOj2Zp/R9apTaSZZN6vAjneG8yLir3lfqdCW/+eFko7LnrYYdSxLL2hGUHRj
	 6LmPtTMJoGiiOcGXn5al3R3o8SPAKi3FG1O+JR24cDwyGUm9dTutgGRRogbGW/x4pfsdR
	 Mc4qv+6VTKw8AkMtkBUr382We810ij5r8nKxXcnKNZbv4NCf4gp3FVvfVJop6E8TRvcfA
	 XdvJ/1HRpLq4Yg7wKAgxWamQISOSr418apQoBfB+ODKutVglrOPBF7TkpirCjvYdh6lMW
	 E5IysBobExPECEG6Ed9iQ/i62k+oQrIlRUIKm3cR0cvSnb0yTAYqawRmtHBukucpGqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m48eOXBm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mh+3ZA9t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9545E606A321
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 16:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9545E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m48eOXBm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mh+3ZA9t
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF07dP141746
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 16:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GpzaCOPWKr8MEv3LeEfjo0nrqvFeRqzQgqVyaw5fr7M=; b=m48eOXBmmfFyb1P7
	OZYsi9G4Epm0pR8icU3hefa3eeaazVTCVBtFUmzFxjDxfiRn6qAZlrTqCaJQ38pu
	LCSn0Qmu3r/0txZru21PrE2AJCwTleJ1LYbwDzzil1WqOjGLqM1mmzmo8X+DSfAu
	EGycWLeniHpEZvNc/MYh5rPbnBhylIKAEYB1pKo5XmS+KF5+lvTbAUUKJbVK8sVp
	IW1E84b2Vc46uNrYxqLHsNWm+PDYDjdUCzsaViDF2ig8n7oBAsAcMnf6OaOBIwCU
	w8O0Hrg04bcn5za/BcBZaKYqSvnkUd4vuKFetxmhLkKLc0zN9x0Md4Uy/i+QXeyi
	Oj9hag==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg4f12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 16:58:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36ecd5db581so2750445eec.0
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 08:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794329897; x=1794934697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpzaCOPWKr8MEv3LeEfjo0nrqvFeRqzQgqVyaw5fr7M=;
        b=Mh+3ZA9tzphNudidF91pvB48NPdpjgvwiU6xJz6455MYde9uhuOIQ7HKLu0MWEQNPi
         6mscC8fxlvU4yNGCkrjoUpDvUgUyq2wyaQVqVRpZiiW5saXhokpkHimFBV8Oa5b6Cr9a
         Upnpa3w8NGclNb+t5Tvmp4PPFGhMSLLVEmXmKRfP9kIUbdTMW6pjqmZl4PhekakuQdMP
         Qv9pGQCap43otJ756rKsP4NG9JjZe4CEDUd+mfs8+gS1ucTanwA2RAiElZ/BVfYpnr1C
         Q4+cEfFrIW1F/e79RO9ywvKFq4xvOpAnztaUrO1mEE8Hh+KvLArT2mzbW+WIdDz6ceA5
         ZWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329897; x=1794934697;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpzaCOPWKr8MEv3LeEfjo0nrqvFeRqzQgqVyaw5fr7M=;
        b=fvw2T/0zt0//17Rz/WLI24cAkvtKTb4aeixrPGMj7osnKHFvuTmYuLjUROr89Smr2t
         A2AHCMQWUXz4kx+cjGlvCGSS3ySjVskfBRL9xVce+8zxhOZ81afTd2WDhXNW6niOdgqE
         HBJgVcyfM0Lz9mogpWDpmWRLVFZVC6gJV030JUQxvqTq1/di5QYxz4KkByuuRQNC5XQS
         MVb4jgoPqM1HVoz0u9wDPxZJvucBlcQfemuC+udNUqdJzXWYgnBn3VUHwgeVtciwHa6v
         GdeLOqwKifauEa2y7NTLgYgbsFcAbZt2AX6NUppReG8ZXQdg0lYbZTao/wa9+GC0WbkP
         SXsA==
X-Forwarded-Encrypted: i=1; AL+hErHPmovXDHMRl6io8NkwcDPnXZ6OANrcTWBZOZlzNvBfQdk3ixg2BwwPt4uk5YoqRoVT62x4WqtFh2tQHS5hPA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/YE4S4HxP2mU6iqAOp52xSSkguDpuu1kPBQPpwXl4p6feEkpPt
	oMFK7jVsAxlB4kix00ri+cIDfRVuzGlv+hYoenNAJZyQ4NlZitQgSY92f/I/P8OtzYocBnpjbOY
	Dnh3Wf9L0RuueS0O0BvX/wSlGV5CPMSeC7A9zvxNSfRG/BXRTpIONaxTorFnC/dMkyfiJSA==
X-Gm-Gg: AYBFou1KDScVUHNt2qJLEa0duwbx9Vwha9i1DzKTqabo5XqxQaArQuuRaaIOnE+HyPs
	n0cpPUx8S/A55EkSmTh/lQXjNCGab3VRsFZcOAe3ldLW/kAnWBCaWYEqVwx489+C/eL5ofbPrYl
	bbUNxd55rgdtiL4ZIjtNYPXH7clbOXXe94ZtcjEtXcPLtGweEk6TWc/GJkYkqloqLkQLRp27wND
	ptDJP+dlxkWcICfe+/Yyoovw9O4T4ULJuUE+RcWp6T0GJYlFPLc3nGUFJRjs9WM78ZdDovqxxwr
	AXUTTFJniFuY+jIH5h4WmVoWACijK8nxDhre0OZJ3CRz7H1FDFI4bvY6zXnxE7n5vHmmI2ZEy4R
	02zF4qAhawbRHgAKisLS3fD7Yt4NsGBKfQp2Vuyt88/qcJTOhHRrKHBKukRlXStvKPAY1pGHLIy
	c=
X-Received: by 2002:a05:693c:8859:b0:36a:1f8:a5a4 with SMTP id 5a478bee46e88-3752031faa3mr4151687eec.38.1794329896912;
        Tue, 10 Nov 2026 08:58:16 -0800 (PST)
X-Received: by 2002:a05:693c:8859:b0:36a:1f8:a5a4 with SMTP id 5a478bee46e88-3752031faa3mr4151641eec.38.1794329895878;
        Tue, 10 Nov 2026 08:58:15 -0800 (PST)
Received: from [10.0.0.50] ([76.133.89.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe3261csm7112966eec.4.2026.11.10.08.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:58:14 -0800 (PST)
Message-ID: <6e5c9103-be42-4f0f-b304-de527ec72942@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 08:58:13 -0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ath6kl: synchronize scan request completion
To: Vishal Gupta <vishal.gupta_1@philips.com>, linux-wireless@vger.kernel.org
Cc: Uwe Schnick <uwe.schnick@philips.com>
References: <20261026131631.1229744-1-vishal.gupta_1@philips.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261026131631.1229744-1-vishal.gupta_1@philips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NyBTYWx0ZWRfX+zuj6X2kvZfo
 8YIbUUa7VtGNAbjyM8uxHRxXXsiqLYag6aW98apQfu1kHzzVccRydQzlf68IwzWq85xtzrvR1Ge
 Jw88dwxMczmU/PKvbLE44ZiIGKxHzn6gD4poFr7sT2QS3g177J4RyPEZxAwo1aHZLoWctdamwkg
 7gOaimu4i7FDLNOSW1iIUGa722DE9xwZsnQp2MYZAHolTTh+V5duTZpyZ/OBBDgh8vzWv+YZ+kF
 cqdZofcAaX70BSWY6o11qdLmxSpgY/Xyy4K+IiHgkZKelGJVVEgIbONDxcH0L3IpdGfzX3U/HQq
 c1s/BwcRyWU6wmfbv5IS+r52xjRdsiaYDQP91jGcMQBJHSWTfjwAytB4wawM0nR8zC5XplvhuZT
 wfj2ipkCG0onIoHAt0dHmgKjgvKd0g71Fi4mrEM7OW2iFf+Quy2g+XAZ2BEqo7jLsM37tCDwHCg
 7S4qA778ZZxFhhvb6aw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NyBTYWx0ZWRfX6zhTe316Cpl+
 5pSCHLxRpP4tlfsakOZlt1e6+D5hsR+UoAftc3ns1nL/jbDOy+mDwKFrw9CIOyktRAX3Y50a9IU
 mj2OAKdkZJzjigNCinKJnmBu2NaNu7w=
X-Proofpoint-GUID: FKC8Dsemfp9I4BjtS99PhEda634iX-hq
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af34d2a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=6LbA7P6A7bvUEkAB8wivVw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=5lX_Y-y2AAAA:8 a=KlgzV10pZxG9VeB4YyoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: FKC8Dsemfp9I4BjtS99PhEda634iX-hq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100067

On 10/26/2026 6:16 AM, Vishal Gupta wrote:
> Protect vif->scan_req with a spinlock to serialize scan submission,
> completion, disconnect, and interface-stop paths. This prevents scan
> completion and abort handling from notifying cfg80211 more than once
> or accessing a cleared scan request. Without synchronization, one
> thread can set scan_req to NULL while another dereferences it, causing
> a kernel panic.
> 
> Signed-off-by: Vishal Gupta <vishal.gupta_1@philips.com>
> Signed-off-by: Uwe Schnick <uwe.schnick@philips.com>

In addition to the strange SOB I have some more comments from my AI review
agent. The first is that the subject is missing the "wifi: " prefix.

Other comments inline below

> ---
>  drivers/net/wireless/ath/ath6kl/cfg80211.c | 45 ++++++++++++++++------
>  drivers/net/wireless/ath/ath6kl/core.h     |  2 +
>  2 files changed, 36 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath6kl/cfg80211.c b/drivers/net/wireless/ath/ath6kl/cfg80211.c
> index 8bbe554a9b364..19934c357a98b 100644
> --- a/drivers/net/wireless/ath/ath6kl/cfg80211.c
> +++ b/drivers/net/wireless/ath/ath6kl/cfg80211.c
> @@ -866,14 +866,20 @@ void ath6kl_cfg80211_disconnect_event(struct ath6kl_vif *vif, u8 reason,
>  				      u8 *assoc_info, u16 proto_reason)
>  {
>  	struct ath6kl *ar = vif->ar;
> +	struct cfg80211_scan_request *req;

should try to keep reverse xmas order when possible

>  
> -	if (vif->scan_req) {
> +	spin_lock_bh(&vif->scan_req_lock);
> +	req = vif->scan_req;
> +	vif->scan_req = NULL;
> +	spin_unlock_bh(&vif->scan_req_lock);
> +
> +	if (req) {
>  		struct cfg80211_scan_info info = {
>  			.aborted = true,
>  		};
>  
> -		cfg80211_scan_done(vif->scan_req, &info);
> -		vif->scan_req = NULL;
> +		cfg80211_scan_done(req, &info);
> +		req = NULL;

this is a dead store since req is local and not referenced after this point

>  	}
>  
>  	if (vif->nw_type & ADHOC_NETWORK) {
> @@ -1060,7 +1066,9 @@ static int ath6kl_cfg80211_scan(struct wiphy *wiphy,
>  	if (test_bit(CONNECTED, &vif->flags))
>  		force_fg_scan = 1;
>  
> +	spin_lock_bh(&vif->scan_req_lock);
>  	vif->scan_req = request;
> +	spin_unlock_bh(&vif->scan_req_lock);
>  
>  	ret = ath6kl_wmi_beginscan_cmd(ar->wmi, vif->fw_vif_idx,
>  				       WMI_LONG_SCAN, force_fg_scan,
> @@ -1071,7 +1079,9 @@ static int ath6kl_cfg80211_scan(struct wiphy *wiphy,
>  				       request->rates);
>  	if (ret) {
>  		ath6kl_err("failed to start scan: %d\n", ret);
> +		spin_lock_bh(&vif->scan_req_lock);
>  		vif->scan_req = NULL;
> +		spin_unlock_bh(&vif->scan_req_lock);
>  	}
>  
>  	kfree(channels);
> @@ -1082,6 +1092,7 @@ static int ath6kl_cfg80211_scan(struct wiphy *wiphy,
>  void ath6kl_cfg80211_scan_complete_event(struct ath6kl_vif *vif, bool aborted)
>  {
>  	struct ath6kl *ar = vif->ar;
> +	struct cfg80211_scan_request *req;
>  	struct cfg80211_scan_info info = {
>  		.aborted = aborted,
>  	};
> @@ -1090,14 +1101,19 @@ void ath6kl_cfg80211_scan_complete_event(struct ath6kl_vif *vif, bool aborted)
>  	ath6kl_dbg(ATH6KL_DBG_WLAN_CFG, "%s: status%s\n", __func__,
>  		   aborted ? " aborted" : "");
>  
> -	if (!vif->scan_req)
> +	spin_lock_bh(&vif->scan_req_lock);
> +	req = vif->scan_req;
> +	vif->scan_req = NULL;
> +	spin_unlock_bh(&vif->scan_req_lock);
> +
> +	if (!req)
>  		return;
>  
>  	if (aborted)
>  		goto out;
>  
> -	if (vif->scan_req->n_ssids && vif->scan_req->ssids[0].ssid_len) {
> -		for (i = 0; i < vif->scan_req->n_ssids; i++) {
> +	if (req->n_ssids && req->ssids[0].ssid_len) {
> +		for (i = 0; i < req->n_ssids; i++) {
>  			ath6kl_wmi_probedssid_cmd(ar->wmi, vif->fw_vif_idx,
>  						  i, DISABLE_SSID_FLAG,
>  						  0, NULL);
> @@ -1105,8 +1121,8 @@ void ath6kl_cfg80211_scan_complete_event(struct ath6kl_vif *vif, bool aborted)
>  	}
>  
>  out:
> -	cfg80211_scan_done(vif->scan_req, &info);
> -	vif->scan_req = NULL;
> +	cfg80211_scan_done(req, &info);
> +	req = NULL;

this is a dead store since req is local and not referenced after this point

>  }
>  
>  void ath6kl_cfg80211_ch_switch_notify(struct ath6kl_vif *vif, int freq,
> @@ -3599,6 +3615,7 @@ static int ath6kl_cfg80211_vif_init(struct ath6kl_vif *vif)
>  
>  	set_bit(WMM_ENABLED, &vif->flags);
>  	spin_lock_init(&vif->if_lock);
> +	spin_lock_init(&vif->scan_req_lock);
>  
>  	INIT_LIST_HEAD(&vif->mc_filter);
>  
> @@ -3607,6 +3624,7 @@ static int ath6kl_cfg80211_vif_init(struct ath6kl_vif *vif)
>  
>  void ath6kl_cfg80211_vif_stop(struct ath6kl_vif *vif, bool wmi_ready)
>  {
> +	struct cfg80211_scan_request *req;

should try to keep reverse xmas order when possible

>  	static u8 bcast_mac[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
>  	bool discon_issued;
>  
> @@ -3627,13 +3645,18 @@ void ath6kl_cfg80211_vif_stop(struct ath6kl_vif *vif, bool wmi_ready)
>  						0, NULL, 0);
>  	}
>  
> -	if (vif->scan_req) {
> +	spin_lock_bh(&vif->scan_req_lock);
> +	req = vif->scan_req;
> +	vif->scan_req = NULL;
> +	spin_unlock_bh(&vif->scan_req_lock);
> +
> +	if (req) {
>  		struct cfg80211_scan_info info = {
>  			.aborted = true,
>  		};
>  
> -		cfg80211_scan_done(vif->scan_req, &info);
> -		vif->scan_req = NULL;
> +		cfg80211_scan_done(req, &info);
> +		req = NULL;

this is a dead store since req is local and not referenced after this point

>  	}
>  
>  	/* need to clean up enhanced bmiss detection fw state */
> diff --git a/drivers/net/wireless/ath/ath6kl/core.h b/drivers/net/wireless/ath/ath6kl/core.h
> index a0b236eeeab54..522844e758202 100644
> --- a/drivers/net/wireless/ath/ath6kl/core.h
> +++ b/drivers/net/wireless/ath/ath6kl/core.h
> @@ -647,6 +647,8 @@ struct ath6kl_vif {
>  	u16 rsn_capab;
>  
>  	struct list_head mc_filter;
> +	/* Lock to protect scan_req */
> +	spinlock_t scan_req_lock;

I'd put this directly before or after scan_req so that they are colocated

>  };
>  
>  static inline struct ath6kl_vif *ath6kl_vif_from_wdev(struct wireless_dev *wdev)

The logic itself seems ok, but the other issues should be fixed in a v2.

/jeff
