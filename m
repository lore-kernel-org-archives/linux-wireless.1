Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448312;
	b=XcumIGE9TlPPGbmSxppjEYZ2PidvsKp+KE4blQ+qoAnckBfQScfA30IqYTmQHJmXnT9J
	 PQv934/9EoCyLuCru8HXlpiXK0A/uOjLxU/IshzzRgP/PHHnb2pPN7e491Q5ScygcBPeq
	 JcxZ7fpjQEURZO2TINx5B5LzZvr9BThOHcXITQ8pCTjkEkD6PtGnOVbVkNHsjgSz2pf/V
	 yM1YU5HlKrZdCjEiTl2WRfdOG7YjzUb5l6PNS0kBXkGlvuzSvMku5X/fFz8LPHbXWVcWI
	 T8HxChY6/jOg0dSgTV+TkHWLwm894ujuEOnm9sAtskG3qn5ddA4K9F06KlgV2MOXDXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448312;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=D/AyflsUAzw465H6bUaOXePHKyaAn5G/VJkaJFWzwu4=;
	b=bD+p/4TK+gqJQBUIFUPNYCL3wVHrlJ/gzOtq0A3PO12FHpvOXvyDszLu6d0zJSyaOagG
	 1CTcdZuVnmrDxpar383RTux8/K/eJIYLcGHvddk2D33GuIIma5IHdaQUX83uQ1sePPqGR
	 ipQ3gjREV+qpKI40bABVwUCQL/DJUyNrdp7KHMd2LnhRd4YsAAt9MoBJCsfRgU34z+fKa
	 PKF+gK8YiAjxn4y6QGBXvo5lTVQ2yCduGqJV1TthnU6ALQNo1cTMJktAsDXKLM5noehUN
	 tjCjgZ4czKEJXJxd0GCZiaAtcCUF9SQW5FZIqt4L6a8dTTYx9q1Xv5W1zAduZonUAgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GlmqgpPE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jNaB+1Tb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0885E606A32A
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 01:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0885E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GlmqgpPE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jNaB+1Tb
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMa9em3581329
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 01:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D/AyflsUAzw465H6bUaOXePHKyaAn5G/VJkaJFWzwu4=; b=GlmqgpPEHfX453eJ
	ja64rubiUGRAWkVRy/R8NLCGbo5ntocBifWFjMcMZj4cWfrjKyseT2/E7mSm5Fd1
	cEUfqbkmGDsJoq9u7KlP/yV/4k/jdXMHIsT+qQxEgKOpyugWfk1a9O1N4/74og+g
	DSIiAEsw1k3C+9mwxX/q8Ln4Eoc71wQSLYycLE+zy4fchW4Ynm3RWDFvpOL31UJV
	bz5HCyyTmtEeaw84+VRXylXDVzoSqvIXRoG8QoR1VuZr27cUphoB9TljJEPNJYfk
	UH7fg5d8e3uuxEX8jZOnWPL2uCkN9W0pQvVGgxrqMioded1ZI4VSTkVPqJ3dq0kH
	BMleGg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8gpvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 01:51:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso4606783a91.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 17:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794448310; x=1795053110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/AyflsUAzw465H6bUaOXePHKyaAn5G/VJkaJFWzwu4=;
        b=jNaB+1Tb7PYftoPe6y5H2z2QL8NEmv2k22ovACuB2ZgSoLwJSoBq0ud7MRVZhq8/ox
         4GFpsYjh8Dw8Fw5SkpCIs5GZDYFGj2zjvXYQ3QlI11GhtVNqgDItF6SJFFDncytbxJFT
         JPxnj6xpIskSztVOzIC68cktt7LteoX8ZaMDwo5d/0pi9Cbu6OzotBsudtj+svj5jR95
         8ZEzRRaazo9gjxTgqwb6dUH+GXj6WrPChBg4UQ+XZ9YchGRciX1r46sjqGXUZtKf5IfQ
         nxB30+LNWjNPfssjO54RTZf8PqqHSyfAJc1OUu0FGthbmTuIqyct3qXk6UQWd3/t8299
         ex9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448310; x=1795053110;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/AyflsUAzw465H6bUaOXePHKyaAn5G/VJkaJFWzwu4=;
        b=ZAVXZ0K6aChU5ZqV2LJdA7BvuU8mVB8tAS0i0pm8IpMb+0L1UKVI49uCJUG9PA/9gO
         kqLKmEXLbAqdn9JG8J0pOh9iQcIJmZMs6Yg8gOmkPczTmf4lOpfk/z4/h3xCVfmoXEjn
         61WDzAgl6uJvo4rG8vZQ9rhHKSZ6i7fA3jJ+7Kc6j9qjvIJMhuhQikCuPLXK4o2ZLTF3
         TRa/2TlUNR6bYIUBhRJz0BTFMsiZiB1AzD3fEWHWoXT9hnopPu6QZgF/jrLvuLQAhEq4
         gelxxCNlgxiLRi5uqQ0CfyIPBwWRCRv2ya7X4+IEUOxP3c/U70uAV+xCGsc8AF29z0xa
         Zefg==
X-Gm-Message-State: APuU4Z/wi1a75fI/s6ZrCYZblzhJy7Lp4tlnFFHYcolfT1/t6YKN2QWs
	xJ8l3HRMpIUw4PO3Kk536Slj+gkPgrVWz6xy9zjUIpKbgHAlVHXgL4xrqK1DaUv7yAXW+ETcDIn
	HyxKWEWB5peCzqEM6POEtcPYw+MfHPLnU6799QZmVniVnefVjGQSz3iYz+CvqSdzrWS41AQ==
X-Gm-Gg: AYBFou1Pq8fp08m2KEU7YrbQChA68Yzb0Gcy6AfLxcrf1GqwE2aBmxtSyM6XXCbOQBw
	jL70l44xrzqBqOVV64kA5aEFAcAJbPY0BSBWBHAX1R3qmPCaEnRBWPK1toG2IiC+Lm0ZLfE/fG/
	DvN0o1Kmb04WA2VAAtVdctfdm0Uh/VLmUcCkJEOef+Hi44izE44qpdWKrpOytJZG3MZ4v4vSLUH
	MKxNSVS94GblxbBttgVarHeygvnb72EMi1tYQtUPBStOdboGH/FVDaElWrAQF8DM4eKFyV7BiQ/
	5lCfx+N0+Ofjn5wpiDcE1ktFTFBEATS9klHEyAAuPp7dbfvXAH1WIHopEtP0hVEz9JcDDkJwL9O
	+5ELduj0PStKO5lZy2rqiujJ/jB5V8xfo1loI1+2Dd31DYNwABkzuazhY2CYVnTZUjvidNkm4lq
	Dsd1CttV416qcDTGc4QMmHASGWGXDnM0VZ2A==
X-Received: by 2002:a17:90b:3d87:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b182d3a4ddmr3950292a91.0.1794448310481;
        Wed, 11 Nov 2026 17:51:50 -0800 (PST)
X-Received: by 2002:a17:90b:3d87:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b182d3a4ddmr3950274a91.0.1794448309851;
        Wed, 11 Nov 2026 17:51:49 -0800 (PST)
Received: from [10.133.33.236] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b19b533540sm1054997a91.8.2026.11.11.17.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 17:51:49 -0800 (PST)
Message-ID: <3bb78f8d-8fb3-4d62-91b9-a197cd5b8637@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:51:46 +0800
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
Subject: Re: [PATCH ath-next] wifi: ath12k: use str_enable_disable() in mac.c
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        kernel test robot <lkp@intel.com>,
        Julia Lawall <julia.lawall@inria.fr>
References: <20261111-ath12k-coccicheck-mac-v1-1-6d8ac143ef05@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111-ath12k-coccicheck-mac-v1-1-6d8ac143ef05@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwNyBTYWx0ZWRfX6FrHwUIldg8e
 0/tzYDzwfzGtBsjDPgM+8i7GTLYV1cuFFnZZxJrn52pi2rZFLmhUGfa9UAY5eaOf6OOFJndsiec
 ub1ipnis92mjXOWjGYS0YYzFYz9NdDE=
X-Proofpoint-GUID: MttPQg8-267_FTSkWoPPb05yVQJ2Jkre
X-Proofpoint-ORIG-GUID: MttPQg8-267_FTSkWoPPb05yVQJ2Jkre
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwNyBTYWx0ZWRfXwepiqFdNCE/N
 tJDNeFhga0rX9YTTkfyoBn5S1T7CYxtUcMOVbOhVfKYY5KkdcxsQeGZyJ+5tBNrjCDt+/WhOdMx
 T8IIEcnQecqvnOwyu5yjbNhm20k2M0Traw3QipJ0QZB/uHTwDkTV8OY5NT4nCpm93PAytl5RbL1
 9EbuZQhXbfRlGVLaoDgE09SfW7teTX4kGYIQQh2MXDsHaRNY79w5w7fpVjqbZ5BFyl/bVTj6bA0
 SR5fzUTzoJCcEQnNSpR5Y00uNbt61MPYELdoqMr3mKA5FclsNUAzwvp3KsreANaKWJXsPdh5MfE
 OGhrbcLzgXY9vGJ9RHuN+FElpHSk8aXFMA8i9Wz5mhJZ9YcD47TD12WlQrN+wykOsF1PRN20zZI
 ZkURpVwVxGtGtNa36wTwWOHaMM4SkS8fbh/BP3etT0NeiynGHR7pXPcLTND9WjN3kN+6hz62iUF
 TWpnAuh+k1rlXjeBqdw==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af51bb7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=6l8UPjPGm3Pco2JvpTUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120007



On 11/12/2026 12:22 AM, Jeff Johnson wrote:
> "make coccicheck M=drivers/net/wireless/ath/ath12k" reports:
> 
> ./mac.c:4556:21-27: opportunity for str_enable_disable(psmode)
> 
> Update ath12k_mac_vif_setup_ps() to use the str_enable_disable() helper.
> 
> Compile tested only.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202411011943.yYxnp7QA-lkp@intel.com/
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 4f16c78b52a8..b37ec64cb639 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -7,6 +7,7 @@
>  #include <net/mac80211.h>
>  #include <net/cfg80211.h>
>  #include <linux/etherdevice.h>
> +#include <linux/string_choices.h>
>  
>  #include "mac.h"
>  #include "core.h"
> @@ -4553,7 +4554,7 @@ static void ath12k_mac_vif_setup_ps(struct ath12k_link_vif *arvif)
>  	}
>  
>  	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev %d psmode %s\n",
> -		   arvif->vdev_id, psmode ? "enable" : "disable");
> +		   arvif->vdev_id, str_enable_disable(psmode));
>  
>  	ret = ath12k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, psmode);
>  	if (ret)
> 
> ---
> base-commit: e3485cc885b81314c814a43db2255b1f9100928f
> change-id: 20261110-ath12k-coccicheck-mac-b5a890df86c4
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
