Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821663;
	b=QENPMkPmuu1573T/oPiaQ3B4Zyusw0GdI/+nRtRDNCwNh2qwAFCjJnO47L8zr8EpLJOg
	 risgeqvPcG3sOQkqsZhxF0p96DKn8cqbmXdEfZDatT5ed5B29fgCiM8qM8nuXNfGQb5jC
	 n/MOB1obWUGoKLEE/g5qZkAfv2zOC0nG6fqlgHWPD+Y0qAHtfRjTsfwlygtxxn+TK7Cql
	 CD01f1pbk80mKmnvscFbl/5pcWRbRn4vl/WaG1KAw5HlYi0osDJCG80A40Lygh6eYwzAN
	 EK6qOHjsfqYPsTv/Sb3CQ7biEpgbL0smpjDeiTho7ONR6Ut55E93iWjPI1NCRPnW71g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bGy6b93BMabiFW4YE7hFTHDKndizv2Qb5AduPJ5ZRN4=;
	b=O9UIwE3DDu4ydJBLIu996EAD7VJCuONaKd4o3nY7IIoy0f+NNJU2ovWvvhBuGPMfEC9O
	 8+X8BRv6VtpF0SdeYkIg3mMT9cJbNRaGfvjPJx49ymu9ULR9k8PXuZnLfEy5ggp7cZnO5
	 PQROeMV0/00qcvelwkiO5SJbs3xKeHKjeQGmsMVRRNWSmwE6FWp+sJ9/helxWCmk9EBCc
	 ISJsEyf+pkxIh2OAK8Owp+6fSrgThkmkXdEZkcPiRctABXC7Pu3whVN104MNwyQI8ugBC
	 VRktw+iz9+mLIBJdkFf7mKmV3L0+DLtGzBhj2yh0QGuomTtqomiqxorp/EBG31IIFUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWEht0kS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="S8kla/XZ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB21606A32A
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 09:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB21606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWEht0kS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8kla/XZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7f0b7424029
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 09:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bGy6b93BMabiFW4YE7hFTHDKndizv2Qb5AduPJ5ZRN4=; b=UWEht0kSmwCIAN1i
	vf89wzG5WssBH3FqIx0wVC17aqTqMf5CR+0Gm0ieo4n1tboCvqOImpEdr580vM+k
	ShnrOj1cGeymCmHM9PXDJawkXUrI6/piZoL1qMHuXwqn2wh2+882xVNssA+fXiri
	vjZ31xJcij+8arPeIpNSVB5t9NrHax4k5HRspNud9mdo1gBEcE8/uH7dbl9vaSdG
	xEE67Q2Qn+IHTV2UOXoaspf0sZY+Dpaxujmy5aHOP2AAJbgtL9wO91pmfFsFLEIu
	TNjRWAS/kVBudFprplsOXU+AyMkqaNWkzLeBM/KhXUGy78clZdWcZ8LpFyrikltl
	H/XcOw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwdrq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 09:34:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4797866eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 01:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794821661; x=1795426461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGy6b93BMabiFW4YE7hFTHDKndizv2Qb5AduPJ5ZRN4=;
        b=S8kla/XZAaXOrKlWzbSRn+2r6+sFFyHjP21rM86IToViOZabgBSQtCpoAgct7UwBkm
         brySwrS34nIWCX/fH6YuMV4E47kZ8SZLrT3YYsjNtdQtSiN4Trfsd7QucQq9Um2/4qdu
         lurPCIhZHcnlQInUBpi49omhuTm+wz8hY4N4adXQRgb6w/uSc1g26CF+oZRPOLWqULIb
         wxzvx6/afcF8Vnm5AP6y6+X0vzSO0fVVT+6IDUCuBX4e5IVKXnsXWs8VOlcxzNO8rKJ+
         8yIL8IUHs9fz0G6zbY3O0dMJENMnjyv2z9DMyAmH8PPNKR9l29067bs8H7by/CHCR/eV
         9XXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821661; x=1795426461;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGy6b93BMabiFW4YE7hFTHDKndizv2Qb5AduPJ5ZRN4=;
        b=T/yL3bzCABCIJMB9NHxKCqDD50mGRvOJGtXfw7nfVwjhuM84P2exYzHvYNxiY0NCZx
         tfPVhSvYS9ipe3P4chIqb8Jxg5u9G9yOEm1KXtpaxpvDnasqVoS7RIN9unVTrOD/6hoW
         0BwZLhBclClkABmi16aTdRQMBBHTqfKbMcBp8Bb7lH+3drZ+//KA16y34deyy8uhV7Wm
         +iWC5v2STTUlxwA8i7cOayepUVnIUJluhIQy6eK8U/8JK2eoIILypHqUiDu2eRmR/V7Q
         JxiDxoxJziXWMiCaMf3oHnSGyzL+uS1QJZJUHF4CiMoJzgIEWX+CSL6xg+VXUGgj7RL9
         Xeew==
X-Forwarded-Encrypted: i=1; AL+hErFFEFNOJ13DtysI3Hy1Fylv0oN5qXM8NKY6jaQLRTCTF5IlQCtS8GV9tu0WZuaqCMwdbSQzCUey54MDSFB6Gw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+510k+q8hop9eTq1xTZEikrrNL5dF3O+h2ILhFGESaKZH182Lq
	U2lrukB8J4yr7PARKkhLmNYuKmvXW3Fn0QErgzKT+pqcKf+hxRsaYn/1zIK68oKHpm03vbBT3cM
	LpB3TPETb7ZUa9H17TEy0PQNNdlCX0++7QIS43sUh4rOvyAZb9yjLoubxZP2YKGFURCIXHA==
X-Gm-Gg: AZFdTZcBjnbqroPVd4I/M+AHI4++74sZa/b324Z2J+PsGfzZJpIDSRST3gtw1SdZZTu
	FPca0aV6oiokpSaah+a/S8ICWoXFDQG3714NZjLBt9rF49CwhqCiTDkn3RRdkQ+rQKdqx0lbu6k
	Ll8dmPfMAp9cHAxU+AhYr128uBmadX2T5sykkbbVdhL72483u6ar2xeCjL4wNSF52ZbJ+ODhxTS
	zQt9Zj2nSVNZ/0tfC17VCl2eIMFDgcTHvroCCARpH2SHf2x0G57dGkrQgs5IDdK2+iNo5B07BNI
	cfS72a3ATUmfk72UpIMQ196sxhhYFnrF/rXryIbE3FUI8xjgQd8YLkQHu5aXOELUEos5i25bU4A
	icbEXNqRGbQhnQ+CQAja/Oin6btW5Sm7SPQlG5fTTL25JmygHtjBESf9mFHAjAF7gkZIV3STuqA
	+1qF93I/85+jR/veux
X-Received: by 2002:a05:7301:b14:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-37b4a3a4b7emr5923278eec.4.1794821660858;
        Mon, 16 Nov 2026 01:34:20 -0800 (PST)
X-Received: by 2002:a05:7301:b14:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-37b4a3a4b7emr5923263eec.4.1794821660346;
        Mon, 16 Nov 2026 01:34:20 -0800 (PST)
Received: from [192.168.11.102] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm32461561eec.0.2026.11.16.01.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:34:19 -0800 (PST)
Message-ID: <f2347531-afa4-41fd-b0fc-4a150c728a0f@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:04:15 +0530
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
Subject: Re: [PATCH ath-next] wifi: ath12k: hold txmgmt_idr_lock while freeing
 pending mgmt frames
To: Changyul Lee <lcy8047@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Praneesh P <praneesh.p@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261116021037.538128-1-lcy8047@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261116021037.538128-1-lcy8047@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNyBTYWx0ZWRfXwJyJbSwrPNdG
 DNVUW/10ajfKfp3Et2TW4E8Jou6fNu5hJwmZkDNY4lMk7FX4FvP7oRTbVWT/vel3F4xHjY7S5gb
 ysTU261au62J4nEbzV05cFqQC9gDadgwIXlc78/wqMag2Rjgu4XXsjqmNlx81eJVbeScpEZSv21
 ruBrt8groQKuFMn9LmmqLbeHHhXjVAvSU4DxQBNz6qfSBG668XAvXUqQ2EM1+PGcAGIIvZP/IY1
 ALBDFhT2CHNrPSj9mJvPCE1KaRtOecTIB9JYqRmXUuKMxT82tMSWSVVEq4afcLq8owTtoJE7qq9
 OlQprAWW1Z1mg9eE8eU3drThksntEpN1wTiEvmURlJfLs9b4y/CHr256e7QDhBpt1CNBHx8kaoX
 nIIe21UkWzE38+CrEipAQ5Z4HIprOB19oFEyWwzSDVi0ytEw7NmHopP+wiLpMuUsMf5mXkxtmeW
 mxSJDres0MPZqKu8T0g==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6aface1d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=U9V32cEEDgW5s8OV8dIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: vzhd1ZNy1pENZWMi27YE0NRmqdv5yG6Z
X-Proofpoint-ORIG-GUID: vzhd1ZNy1pENZWMi27YE0NRmqdv5yG6Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNyBTYWx0ZWRfX0xmcfriqwjMI
 sTHi/CmaBUtoPIq9KBHjbHuF3TLK+4htk/MxKoWOVgOyTVBhSux+BjQYRIt0L4w2eGEB+SmnkXg
 lU72GADqY71yZ5LW4PoCQaqA2l9S3n4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160037

On 11/16/2026 7:40 AM, Changyul Lee wrote:
> ath12k_mac_vif_txmgmt_cleanup() and ath12k_mac_tx_mgmt_pending_free()
> walk ar->txmgmt_idr without txmgmt_idr_lock. A WMI management TX
> completion can meanwhile remove an entry and pass its skb to mac80211,
> which frees it. ath12k_mac_vif_txmgmt_cleanup() then reads skb_cb->vif
> from the freed skb, and both walks can read an IDR node that was freed
> after an RCU grace period.
> 
> Hold txmgmt_idr_lock over both walks and make ath12k_mac_tx_mgmt_free()
> expect it to be held.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Found with a static analysis tool we are developing.
> Compile-tested only, with x86_64_defconfig plus ATH12K and W=1.
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index eee3f38375ae..bffb2edd0531 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -9220,10 +9220,9 @@ static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
>   	struct sk_buff *msdu;
>   	struct ieee80211_tx_info *info;
>   
> -	spin_lock_bh(&ar->txmgmt_idr_lock);
> -	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
> -	spin_unlock_bh(&ar->txmgmt_idr_lock);
> +	lockdep_assert_held(&ar->txmgmt_idr_lock);
>   
> +	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
>   	if (!msdu)
>   		return;
>   
> @@ -9241,8 +9240,10 @@ void ath12k_mac_tx_mgmt_pending_free(struct ath12k *ar)
>   	struct sk_buff *msdu;
>   	int buf_id;
>   
> +	spin_lock_bh(&ar->txmgmt_idr_lock);
>   	idr_for_each_entry(&ar->txmgmt_idr, msdu, buf_id)
>   		ath12k_mac_tx_mgmt_free(ar, buf_id);
> +	spin_unlock_bh(&ar->txmgmt_idr_lock);
>   }
>   
>   static void ath12k_mac_vif_txmgmt_cleanup(struct ath12k *ar,
> @@ -9252,11 +9253,13 @@ static void ath12k_mac_vif_txmgmt_cleanup(struct ath12k *ar,
>   	struct sk_buff *skb;
>   	int buf_id;
>   
> +	spin_lock_bh(&ar->txmgmt_idr_lock);
>   	idr_for_each_entry(&ar->txmgmt_idr, skb, buf_id) {
>   		skb_cb = ATH12K_SKB_CB(skb);
>   		if (skb_cb->vif == vif)
>   			ath12k_mac_tx_mgmt_free(ar, buf_id);
>   	}
> +	spin_unlock_bh(&ar->txmgmt_idr_lock);
>   }
>   
>   static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arvif,
> 
> base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
