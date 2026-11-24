Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555191;
	b=paY7lltmbGIkQyXnPIGLSSBzuBk9NFud/scDpQxiifgH5HfFzZ+g//lP4tXjgVkECsR5
	 v+ZPkM7Mx3ohzMgKCcPi917i5YA0XfTsVzNkybt74oMCK7UWVeSIifwBkRoROFLg3+iBP
	 QAykYQmBzXRZZCoRcEHV+GWHbJMYhjWlPckUT5e9KrZpOnC8iJpZgDyUTpjSCbQRXVtn/
	 fmIS4nUqsDZBvUwEPaM11tGPLWLHSoEBKaeJNkEJI9Nj3GKKpINYFEJF2sCWVuq6Z2A/y
	 zcWpEXxYsVYggw9OVJcnV0Mekas4LWtrIKOIgleWKq0zdayuuL3J+ABFF/BzXV6/cOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Jmc8x/uklGXQnfhDsK8nj9eRcxikV5Zu+dZzBzl6ZvY=;
	b=1TRxU4Ioy3o7yOBfg32crqEKWxRVYYxMJ1C20manKj4JTmAL4bPVHXE9sPuujR6cnQFP
	 hkyVMZhMpI0tm1wUF1K80+OoVKyZW8e9aAdAKi+PuLZfiAN12iJrbzwpe+dAkjjzNO5C1
	 HUdai/MCvZ9rFS6RVpFGTRtFFugLhIg6pd10F3yHOe5qIDlhJUn8ylkJ96Q8AXjYDGkZA
	 Ucfny8p8H3JeY2IBNoWHMqY3NNx++Fbd/G//RmMnH0dxi7pmSRNuA47ZNdEj/bEnIqNm4
	 /t+cbZAmPRM4eJhem0thwv8OUXl6Qr6a5sZFYghQ8zryfbg/whwRx1H6JHtpxLB2HCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACr7VcTZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QZmQh/AQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C72606A338
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 21:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C72606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACr7VcTZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QZmQh/AQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJLLoY1723194
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 21:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jmc8x/uklGXQnfhDsK8nj9eRcxikV5Zu+dZzBzl6ZvY=; b=ACr7VcTZT7KgMvkb
	f/riEMLagAVttUZbXJQup8HmnwrVymJIAFwa1DlqcPXhoe5vnTScPac8m4AKp6MG
	Wwo71pqbg2nr8WOm78tevSJMr9hh/gKJYpT/n55WKYDlgEr8D+2xA4zLt1qoDxwh
	j9wMpBH1fzo0O8XkldvjDMaYMKMtuikJBYz4I8Rs5z4EfSEjAqy5184Qi5NxMgG2
	T2FAQohhcUxLTvN3iD1vewKWOUOlPu6QySCGEB8mSWitYMNTdm1BC3j5yEmDPUUV
	8Zci2JF67xUD7Hl6KEmywPb3nvRfchAhnlWlibk/yqpWPRNbk0071XbvXU2VFKzZ
	E2BrCQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gns8de6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 21:19:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso8613217eec.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795555188; x=1796159988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jmc8x/uklGXQnfhDsK8nj9eRcxikV5Zu+dZzBzl6ZvY=;
        b=QZmQh/AQe03ES5EognAni6lskFfdeeHB54EyR+pRM570qBwQsiVRs3n4O6ViCCx+ez
         dDkRiecbceWM3qH5gHxFi+WTlbNfuODLAx0yQ6Yo09YVtTMpGbHfYJk6R8YSx9e31ulN
         +LhIwcdasyofAgQS/90LIT/2Ww3w2Gv1YBSHK7Tv+fElFTk8/iG7K6+9JML0AbbSeFga
         BbR8nFP+VgxmXmrW3hF4xX6a4GrVlr0NvlC6rwZhx1G4gqWDmBdARlXXfsNCz+k02GcL
         ckM4d8q111ithWuY4MWzYxG+nBWVFwocT4DaQ8fxnYpsVE7r/EdMcbKChQG/fAon0uPs
         agVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555188; x=1796159988;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jmc8x/uklGXQnfhDsK8nj9eRcxikV5Zu+dZzBzl6ZvY=;
        b=F6rmI9bEpmQzN708solyRx9HEp9ptLiSGTCRB7fWACeYuLCgvn9nJA/SJLx5RM6XWE
         ojYPIL2V+S3DAbpEjVAHU1E+i4+7H8//ljb01LLSvtWAl3Wy1/76tqIX7GADDsYFDeOz
         cIRdZpvOCjhl2pGnw0Cm+aHIj+GefQPv1wf4oWgsF2VyDuZ8/+Mqpt0a3Sth4iflE01v
         rWpTgFle82sKDKNjauvSFxZ6eqYBadZLEXwZ9iP1TC34PGSDCZyuhxDGtOreVEkAFgtl
         1HtRrelzkscN/oCMH5bv61NCOwR2LLJNR7K9st+H0sMYAAjvmCykT48y7pFC6oQRF416
         wpGg==
X-Forwarded-Encrypted: i=1; AL+hErHdf+0zlUAyrXWi33VHwY6Y+oYJhe6yMOOH9kwy6yKauVKBcVA02AxMGWPfZc4K1FCwulQFcsZWHOlL99sihg==@vger.kernel.org
X-Gm-Message-State: APuU4Z94OUupWoW4MyodjM3e4xr7Eu6QVm99hXYvfVZH5QuanDsd4Pky
	12XfRerSjM+ghJo6UlZKHM5NeA3PjL37RgDdiogHR8Pknbg+wggF5DlA7iLtl+0JmpGtNQvttwd
	+H5fbYpJRLeZ2P3eXlT8LpnxDPY6TVVZSwTX/0+qTogXN1zn2MVYtYAo6hwXJTIxG7uOXlA==
X-Gm-Gg: AZFdTZcUgtKeWSbjofNaq70y1fhAcXc3Erazbw8zAucccrqS+3U9tMiKJN273I7P3XM
	vgMPLUe4tWO1T6+gBNKSD1IcfEz9pXtKv+G3S2TQtP+GMECC8PT5ruEUZ1dO08Q0uvQeHFgqWdm
	ueieyJxXL4RAhgSPTa28Ljxvg3mw2Oj2VmDpgD87jvzmNGdzsrfDB41L3HRWtMh4qOr+XLHcY4e
	hP+Nq6zboHyFtrpBue00G922CRboY3vDyugXQjvRSWP0y2cbRmFio9s9T159DQRYNPN1iMgeWvq
	OuFQ4u+f/9uPcIjNHUPVr2LLgt90auEaE+ZLPy9ipNSJQUcvk6wLnRG7OL7oMwq2JPYg8YOA/Gp
	GKWOUgDA7IJoBz8v3na9w5LaLy2FYjotw+MSAZQEJx2ZLlTJojObTyG8uyfj/JyHoj6w7VvEpr4
	wLG+/bslH/Rpe7zIK7
X-Received: by 2002:a05:7300:b089:b0:386:9c9f:83d8 with SMTP id 5a478bee46e88-3869c9f86bbmr12711149eec.17.1795555188352;
        Tue, 24 Nov 2026 13:19:48 -0800 (PST)
X-Received: by 2002:a05:7300:b089:b0:386:9c9f:83d8 with SMTP id 5a478bee46e88-3869c9f86bbmr12711127eec.17.1795555187818;
        Tue, 24 Nov 2026 13:19:47 -0800 (PST)
Received: from [192.168.11.103] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm14506896eec.9.2026.11.24.13.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 13:19:47 -0800 (PST)
Message-ID: <e5864418-b181-40b9-8718-2815d84d453e@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 02:49:43 +0530
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
Subject: Re: [PATCH ath-next 3/7] wifi: ath12k: fix
 ath12k_mac_op_change_vif_links() for active-link updates
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
 <20261118025520.39269-4-miaoqing.pan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118025520.39269-4-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EXtbUb1JEfBzLXDVQrpMCGEH7e0jEUKu
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b05ff75 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=AXF9_A-i7_gDoTK9JAcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4MyBTYWx0ZWRfXwabcYG/+K2ES
 2ENPM2Vur5u9BxGn/K0l/yF+r8DqTXr9x2gMN4oeXNqEkKSxYQLXZq2pCJBafkbXuK8Xl5MVG9T
 HKr3StswnqptwMJy2cqdARRDUcZNS78=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4MyBTYWx0ZWRfX+m83M9MmBo09
 QjTpY7v8s5IQ0KWx2AbocQs4oCJ4Rmo/Ae/UK5UOQSzMTEZkkUUHV8IHI0SCJT/eLMjM3YWI+Ja
 5W2BcCuif7skMBV0dzlzAugT5uV+yFLmZlzXqct5G+LFCVQNUDB3BSN1IifRA76MN97f0Rt1b+Y
 rFwfAgU2DP9FHY/CDqJcoDecKVtOwSnYgDz7MD1zCc0e4yz+b2ZNWSEjVyptMCvtFf4ODsaPE7f
 L81wA16HEAZVTC5JhYDb1rEyX/r7Z+ZusTLuK1V2qZKM4bWtYAr+tIA4ecNjKj13oF45zbehrGU
 CrCYPtRNiXIg06eHuADBEtFxcOisXkmAkYeo3xOz9Wpc1Ak5SlfPlWqB+no7jv4b2meZ1/HdjWl
 kid9NgG71jYgpoAknbYKg5+sVMOhgv5v5fVIMr19Qk3MWIIYGc3/h8VN5+aHEF+vTwUOwBFNH7x
 zTC0tqFq3OhWZDzVMVA==
X-Proofpoint-ORIG-GUID: EXtbUb1JEfBzLXDVQrpMCGEH7e0jEUKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240083

On 11/18/2026 8:25 AM, Miaoqing Pan wrote:
> Currently, ath12k_mac_op_change_vif_links() derives the links to add and
> remove from the old_links/new_links arguments: it creates a link vif
> (arvif) for each link in ~old_links & new_links and frees the arvif of
> each link in old_links & ~new_links.
> 
> However, mac80211 invokes drv_change_vif_links() both when the valid
> links change and when the active links change. In the first case
> old_links/new_links are the valid links. In the second case they are
> only the active links, while vif->valid_links is not modified. A link
> that is deactivated is therefore reported as removed, although it is
> still a valid link of the MLD.
> 
> To fix this, derive the arvif lifetime from vif->valid_links, which
> mac80211 updates before calling the driver and which an active-link
> change leaves untouched. Create an arvif for each link in
> valid_links & ~links_map and remove those in links_map & ~valid_links.
> A link that is only deactivated keeps its arvif. On disconnect
> (valid_links == 0) every remaining arvif is removed. The WARN_ON() for
> adding a link that already has an arvif is dropped, since links already
> in links_map are not selected for creation.
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 315d80be304a ("wifi: ath12k: allocate new links in change_vif_links()")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 3f106ac6141c..28cb549b1f46 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -4377,9 +4377,8 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
>   			       struct ieee80211_bss_conf *ol[IEEE80211_MLD_MAX_NUM_LINKS])
>   {
>   	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
> -	unsigned long to_remove = old_links & ~new_links;
> -	unsigned long to_add = ~old_links & new_links;
>   	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
> +	unsigned long to_remove, to_add;
>   	struct ath12k_link_vif *arvif;
>   	u8 link_id;
>   
> @@ -4389,14 +4388,15 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
>   			   "mac vif link changed for MLD %pM old_links 0x%x new_links 0x%x\n",
>   			   vif->addr, old_links, new_links);
>   
> -	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
> -		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
> -		/* mac80211 wants to add link but driver already has the
> -		 * link. This should not happen ideally.
> -		 */
> -		if (WARN_ON(arvif))
> -			return -EINVAL;
> +	/*
> +	 * Link objects follow vif->valid_links, which mac80211 updates before
> +	 * calling us. old_links/new_links only describe the active links and
> +	 * must not be used to decide object lifetime.
> +	 */

This seems quite ambiguous from the mac80211 code flow,

Consider a 2-link STA associated with an AP, where one link is removed 
by the AP:
wlan0: MLO Reconfiguration: work: valid=0x3, removed=0x2

In ieee80211_ml_reconf_work(),
Initially:
valid_links = 0x3
active_links = 0x3

ieee80211_set_active_links() first removes the link from active_links:
valid_links = 0x3
active_links = 0x1

This calls drv_change_vif_links() with 0x3 -> 0x1, but ath12k would not 
remove the corresponding arvif/arsta since vif->valid_links is still 0x3.

Subsequently, ieee80211_vif_set_links() removes the link from valid_links:
valid_links = 0x1
active_links = 0x1

However, the call to drv_change_vif_links() uses:
old_links & old_active
new_links & sdata->vif.active_links

which evaluates to:
0x3 & 0x1 = 0x1
0x1 & 0x1 = 0x1
Since old_links == new_links, drv_change_vif_links() returns without 
calling the driver.

After this, mac80211 removes/frees its link object, while ath12k still 
seems to retain the corresponding arvif/arsta. Is this expected?

> +	to_add = vif->valid_links & ~ahvif->links_map;
> +	to_remove = ahvif->links_map & ~vif->valid_links;
>   
> +	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
>   		arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
>   		if (WARN_ON(!arvif))
>   			return -EINVAL;


-- 
Ramesh
