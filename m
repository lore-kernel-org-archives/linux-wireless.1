Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058075;
	b=wpCyGYOvXHTTwPGL2Bkm20MibEPYgwYkd51F8kZto8O2T8d0hr+FcK2hjWtpaVLOW0XQ
	 94rlDS3GP5pWbzizBEcPjQHH7/JI8GmsU5Kk0MUpw+X8wg9ZidlPIxNbOyTRQSMaq5aQa
	 tFUIuiP5dAh+Zd4soKtZVozdq4nPan9sxOsKatUwIm9jQTcy6K7U+cuO9679DN/otd0Ri
	 QGjhwhO8mKdLuCTYn/8Uqznsug25lMF0nsmedGB1P/ng1/So2AKdR3nqkLpxiO+irFdSJ
	 tryklqfyF++taFHhcsEkeGROiHMGEZ8TvMZmMuSrYUFeO5x7GNSX1u6qxfzpBeZTRsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NsHZlyBYnBWBlkUBeo+t8OpVdqdxoeIOuPko84vvh+I=;
	b=H/XUrIoAXiM3VH0LTwrRgn0iH1knjcJWKNrXep1jO6GTosjRDKJQJobk18FqqqW1SP5P
	 6A38D0OFrTlmlfgh90v6uOUphbRXpQVyGHNc3n6qgGoo4ZhzIPffWqXMvE0dGg1pTWyGd
	 1SJAcAg6Rv3CriLsECEpoHkU3BI10n4hZSXHcHjxZ16xArRFRWkHOneJAKtctzz3HCtJx
	 xEIkVqy6llwE4i1+9Mun855KiPwpjyo6SQyJUNG6wyd3hYbUIXM6soWR7+9mUWIQMNUpG
	 9WyQnmLAPqRjpJDJG9PqW1ofSutDDuTRx0LbScOJ7Rh4imw5S5D58st2kb6tqNbgebA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0JhvnA+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvABrCrC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF19D606A325
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 03:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF19D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0JhvnA+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvABrCrC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1AwJ53780239
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 03:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NsHZlyBYnBWBlkUBeo+t8OpVdqdxoeIOuPko84vvh+I=; b=o0JhvnA+AaHuThQw
	htGjLCwfd2lEeJXCmJYuJAXKMQXs49afDokU+/6Tfx4oMRFpXTtliA4pEtiWBRMS
	skA1kHS8LnegiSVm0KRNSB9ofum3kLXYy8lOOGrixe33+zELNpctp6pVIEam6XZ0
	Z70JJXlWN00OQKTIRMifEKsmOmMSMBcSlPxiuaxnrZ7MlnrhT/2A3eLbp05tiu+m
	seYyHF3sS/olVQquWkuvD9xzqALxXODtThWzDlju07ScNPClcSN4ckRtjdDadavx
	l+7D6Keha3WGJSs3QLu+LpPa4JjwcH7MW2zA44Y4Ac6/lSYZrPUxnqMMqBfrOsvH
	aaz+kQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnjb5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 03:14:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so1406169a91.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 19:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795058073; x=1795662873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsHZlyBYnBWBlkUBeo+t8OpVdqdxoeIOuPko84vvh+I=;
        b=GvABrCrC1JgNcPWUf+ZpHP8RSovNZn3g1hKV8/bXQixzoNjyhHRp3ktFQU4YiDLRaV
         2iYwHqdYbgsy03mbyUma0/timwHlALBmgfKncT1jvPhRhqHgcSM5KFIjfdO00KvPE1cE
         hlaECkNvUivJtmCIj0d/Ls/C+2Jv1NukZC9kgI6mJisDkS3e3WUubtAiz8tqulsBaBMX
         jjHR6rndhKz2Ye+9EBVq7DVKbXeUo8HWYiGDu7iFaRVuoK6twfo9w0wGM7mv8dkcEDrk
         H24H4EApmZuBPLRhp9aYHoeSWs7Z4D/qOGTzOMDMzR7jU1CZl4Fl4PWRnB4aA5F3Xwa5
         Ji4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795058073; x=1795662873;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsHZlyBYnBWBlkUBeo+t8OpVdqdxoeIOuPko84vvh+I=;
        b=w5QIAvkVIj8W4JQ6rY/dbPWH2d7uxPtnvw4/AMOiB8fUShTsB+W/SJ6oUIktQWuV+a
         AQJtwGvUk/dPoug2+cysYt06uz7181A7WXuLo3hJ3K3U5TAzyvqVqYAxcpqLkR3MTcNw
         BZI+0OI6mBMyHFg1COJvW0tPyORQP19+OPLKeajU14iUbVZTDJHiBSEJsldmGfHKJ2Je
         hwcOXBnA2SGUN0qix8dZVaKgiNcuu9sQr7lRJ8O6rMNovXUajPeEYPlk74egba/78XfB
         EAwM8Jz8hNAHhWSUJlru6nCr0yyPylg2JjTkHyLnPc2aQ7v5qiu9Jja8XjfeGQFqjiwx
         OBKw==
X-Forwarded-Encrypted: i=1; AL+hErE61Yc4gVgsWmwtWP7CUyRip3wXlTqHbk2AzeDBiR8aeS9JkTKYjlv4gsAcF+xt5bYxsbVoY1zLiNEXqRhDqg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9sXXXVic+Qh28uoLgcMiuTnzWc1k0jIp17urwrYwXRCcbsjYkc
	fFNC0W6oVcQotwvzXPUSWVd5PfeGfbfjirXjbgPbbjP2vXgKK/pUVrBRFYVxPhVuOaFVbuftfqD
	UO4uvDlG9EAbs3nqidBc6Q6+EB/l19XxRK8DMyz1KxH0B2qRHaHZyK2znm2winH9ju2k8KoBeCw
	TsOg==
X-Gm-Gg: AZFdTZdcJYCKelnAV0R/rPYKDffELlBNCewrn+Gb/Y/geTT0t2uJG9AjwmupfLKXvLm
	XYTn53t94Zy0cZwHk3+hwetOkIgMAofsDsROUXbQEQDOSKHc+CiAZtDP3fhGlI7sV6jrRDZvgzF
	eBQ6FFF91ptUY1f+oratK7n873N80B4k5PMYoDa59DZbOg9M0GQ+6pEWkriPSOhgAh1KaFG8Uqo
	ELE3CrgKX/RPkYQHszfCUwpw6ogbgnL8YjMISVTxhi+tbZvUfHak8t7rkcrx9MDAaScM6Be8Amv
	YfUvP31zkfmwmMQV152FB9Q8TWVvphXxdf8oND1WqTeVRFHz4qJdxLL55tAlH7MNxclguPaSnRs
	MBdlsImV0R5BToMGBXUtNIFNqmOUp667mRd6Ohg7RhoXgZ4DouWWfjihiYy/sUAkJ6qG86zEXuz
	LpqBA6Zeg0z0NbeVT7FA9AiGXn3LyGZmP7h/VYOFmmJIQA
X-Received: by 2002:a17:90b:5643:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3b3d07b92d0mr4313055a91.30.1795058073073;
        Wed, 18 Nov 2026 19:14:33 -0800 (PST)
X-Received: by 2002:a17:90b:5643:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3b3d07b92d0mr4313035a91.30.1795058072513;
        Wed, 18 Nov 2026 19:14:32 -0800 (PST)
Received: from [10.133.33.10] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b401f73a4bsm279829a91.0.2026.11.18.19.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 19:14:32 -0800 (PST)
Message-ID: <616c30c0-8152-46a1-899b-e41b28b195cd@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 11:14:28 +0800
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
Subject: Re: [PATCH ath-current v2] wifi: ath12k: parse nested DBS/SBS
 capability TLVs
To: Jonathan Wolf <wolf@pi0.com>, ath12k@lists.infradead.org
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118204307.3154270-1-wolf@pi0.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118204307.3154270-1-wolf@pi0.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YuqsGyOvKzJLzyh72nYqhxc_BWaE9In9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAxMSBTYWx0ZWRfX3cgDgwMF1dvI
 QzqFF+ZIzUIcHNgLhRnK8VN6k/JN5qH+MZQIvjBoX9BJ2yqqxNTOmdxCwKz/13/apt0RnCb5CjV
 X/lCKkKtZj6v2CwzNuhRfV1NPxQR71oBYU2sXthFJfvWXgSOyV3RaKO8fupFjy6pnZb+MnHbfIV
 oYLjbcYHzji9LlzaHBA8I4Ho1TnCSFPBAnSoLWl/MhfZVYFay2XwYFxQIOCvT/3ALIxG8vm+THp
 Liyn7UJpRPdNPXFYnEbcDEvm4sfZUHLi9+ar428U/DVwb2jnZ1+01YvBLtYjDhTX4mPiE58idPn
 nMeAGJ0zddDLLmKqAM2zwodQr9W8SPl3HhxaBGeeHKOYzQpwfElXTrZZmQvOke9+Z07QBgWKhzo
 /yeN2NxASD2tlmm6q+koQNSuS0tXIdvtVzCR0BvgqSnN+bjJvv2e9t0NAbVOhkk77v0lc7j64Mv
 R+a0mAkL355ZPcTfUUw==
X-Proofpoint-ORIG-GUID: YuqsGyOvKzJLzyh72nYqhxc_BWaE9In9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAxMSBTYWx0ZWRfX1eqHeRXsD7M6
 9HNNFwU3gl3aq2fvLMXvJTBWm3jdm9Az3XSBAZ425AEF0shVWHd+QCnlZEIvwXGGOB4f2r+a9b1
 8697JXpTibTydmK+EIfCMG6gdSO3nww=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afe6999 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=apydtGMFAAAA:8 a=trgHqd-T1HFGbJ4hnEQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=_GdCGhGMWlTvChih0T78:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190011



On 11/19/2026 4:43 AM, Jonathan Wolf wrote:
> The DBS/SBS capabilities in WMI_SERVICE_READY_EXT2_EVENTID are carried
> in a WMI_TAG_ARRAY_STRUCT containing nested TLVs. The array pointer
> therefore points to an inner TLV header, not directly to struct
> ath12k_wmi_dbs_or_sbs_cap_params.
> 
> Casting the array pointer to that structure reads hw_mode_id as
> sbs_lower_band_end_freq. On WCN7850 firmware advertising hardware mode
> 5 and a 5900 MHz cutoff, the driver consequently records 5 MHz as the
> cutoff. This produces invalid SBS ranges such as 4900-5 MHz and makes
> a 5/6 GHz MLO pair appear to occupy the same hardware MAC, triggering
> partner-link deactivation.
> 
> Iterate the nested capability TLVs with ath12k_wmi_tlv_iter() and reject
> unexpected tags and payloads shorter than the capability structure.
> Use the first record, matching the vendor host extractor, and leave

hmm, I don't think firmware can send more than one records. The firmware api clearly
documents there is only one TLV embedded:

typedef struct {
    ...
    /* Followed by next TLVs:
     *     WMI_DMA_RING_CAPABILITIES          dma_ring_caps[];
     *     wmi_spectral_bin_scaling_params    wmi_bin_scaling_params[];
     *     WMI_MAC_PHY_CAPABILITIES_EXT       mac_phy_caps[];
     ...
     *     wmi_dbs_or_sbs_cap_ext             dbs_or_sbs_cap_ext; <== this one
     ...
} wmi_service_ready_ext2_event_fixed_param;


> the cutoff at zero when the array is empty. Only store the cutoff
> after the complete array has been validated. This leaves the existing
> hardware-mode and link-selection policy unchanged.
> 
> Tested on a Steam Frame with WCN7850 hw2.0 using Valve's matching 7.2
> kernel source. MLO advertisement and radio-mapping diagnostics were
> enabled separately. The revised parser reported a 5900 MHz cutoff and
> the driver mapped the associated 5260/6295 MHz links to separate MACs.
> An unmodified upstream kernel was not boot-tested.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
> Signed-off-by: Jonathan Wolf <wolf@pi0.com>
> ---
> Changes in v2:
> - Separate Tested-on from the official trailers, as requested.
> - Log DBS/SBS capability parsing failures before returning the error.
> - Move cutoff storage and debug output into a dedicated DBS/SBS parsing
>   helper, following the existing capability-helper pattern. Commit the
>   first record only after the complete nested array validates.
> - Remove the evidence link to the repository that is now private.
> 
> Local validation: 15 SERVICE_READY_EXT2 parser cases pass with ASan and
> UBSan, including malformed later entries preserving the previous cutoff.
> The failure cases also check that a parser warning is emitted. Strict
> checkpatch on the code diff reports no errors, warnings, or checks.
> 
> v1: https://lore.kernel.org/ath12k/20261118012321.2861920-1-wolf@pi0.com/
> 
>  drivers/net/wireless/ath/ath12k/wmi.c | 47 +++++++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/wmi.h |  1 +
>  2 files changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 75b259990..0cf6e1eab 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -5781,11 +5781,47 @@ static int ath12k_wmi_update_hw_mode_list(struct ath12k_base *ab)
>  	return 0;
>  }
>  
> +static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag,
> +				       u16 len, const void *ptr, void *data)
> +{
> +	const struct ath12k_wmi_dbs_or_sbs_cap_params **first = data;
> +
> +	if (tag != WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(**first))
> +		return -EPROTO;
> +
> +	if (!*first)
> +		*first = ptr;
> +
> +	return 0;
> +}
> +
> +static int ath12k_wmi_dbs_sbs_caps(struct ath12k_base *ab, u16 len,
> +				   const void *ptr)
> +{
> +	const struct ath12k_wmi_dbs_or_sbs_cap_params *caps = NULL;
> +	int ret;
> +
> +	ret = ath12k_wmi_tlv_iter(ab, ptr, len,
> +				  ath12k_wmi_tlv_dbs_sbs_caps, &caps);
> +	if (ret) {
> +		ath12k_warn(ab, "failed to parse DBS/SBS capabilities WMI TLV: %d\n",
> +			    ret);
> +		return ret;
> +	}
> +
> +	ab->wmi_ab.sbs_lower_band_end_freq =
> +		caps ? le32_to_cpu(caps->sbs_lower_band_end_freq) : 0;
> +
> +	ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
> +		   ab->wmi_ab.sbs_lower_band_end_freq);
> +
> +	return 0;
> +}
> +

as stated above, maybe we can simply have:

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..f7ac9def9213 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5831,11 +5831,28 @@ static int ath12k_wmi_update_hw_mode_list(struct ath12k_base *ab)
        return 0;
 }

+static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag,
+                                      u16 len, const void *ptr, void *data)
+{
+       const struct ath12k_wmi_dbs_or_sbs_cap_params *caps = ptr;
+
+       if (tag != WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(*caps))
+               return -EPROTO;
+
+       ab->wmi_ab.sbs_lower_band_end_freq =
+                               le32_to_cpu(caps->sbs_lower_band_end_freq);
+
+       ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
+                  ab->wmi_ab.sbs_lower_band_end_freq);
+
+       return 0;
+}
+
 static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
                                         u16 tag, u16 len,
                                         const void *ptr, void *data)
 {
-       const struct ath12k_wmi_dbs_or_sbs_cap_params *dbs_or_sbs_caps;
        struct ath12k_wmi_pdev *wmi_handle = &ab->wmi_ab.wmi[0];
        struct ath12k_wmi_svc_rdy_ext2_parse *parse = data;
        int ret;
@@ -5890,12 +5907,13 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
                } else if (!parse->htt_msdu_idx_to_qtype_map_done) {
                        parse->htt_msdu_idx_to_qtype_map_done = true;
                } else if (!parse->dbs_or_sbs_cap_ext_done) {
-                       dbs_or_sbs_caps = ptr;
-                       ab->wmi_ab.sbs_lower_band_end_freq =
-                               __le32_to_cpu(dbs_or_sbs_caps->sbs_lower_band_end_freq);
-
-                       ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
-                                  ab->wmi_ab.sbs_lower_band_end_freq);
+                       ab->wmi_ab.sbs_lower_band_end_freq = 0;
+                       ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+                                                 ath12k_wmi_tlv_dbs_sbs_caps, NULL);
+                       if (ret) {
+                               ath12k_warn(ab, "failed to parse DBS/SBS capabilities WMI
TLV: %d\n", ret);
+                               return ret;
+                       }

                        ret = ath12k_wmi_update_hw_mode_list(ab);
                        if (ret) {
