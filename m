Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681244;
	b=0cE1Ak84p5Xs9x5khee5fG6kKHOmLV4xavfSVyCj8qhtN/bDmqRk22++xSbvNIPlmEj7
	 1HEt5Y1kug8BguGAeSJMpgsbQvW3cdYDz93aWvhCvthd06xTKg/Rb+L9MpNiTHfVP+otF
	 sDXHYszyHBLfsxEK1+4UDJoIYCyRwjav0k5scUeGUw8gASSgp1ljiSEdMfQzqWn4vgfUC
	 M1cDBiVXqBhy7ODsSM3rOAjFknmBHX7Eutu5sMZZhuAY3861t0JTD51nzIUYlbgSpVGzW
	 G+LW5waZjQMZ1scEU1Ik3VFqFNCdKoNUjLmhGgfafOh+8njzAq4olfOyQAlkpe5eFbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xaVcPCOyezxrM0sb+d8/47Ilh9xHOyd5HbtN93BsFTE=;
	b=qF+VBRLO8uQ2x0HIr8yTBaJLXEIC3ZkRsTXhRE00B19GlCEfqGPuqNIQk/fJBIAf6UDg
	 /Z988nBoRfiW7b09/iw20jaduMPr+e25gEF0+JsTxBuAKp7sdzFqWxbjOvon6caFDSYtO
	 3RTabdly3RI5gtvabtLbPpF9M3C0zK2t3GcvPTjmw8E9UfDX4rs/Aao+XeG+D39mrNaoh
	 cHJsG4lctKDsvAr3xZMGMN87gPctJJuwtdUYmf/FFPVETyqkW4/xGamwWwNMhYyrbqf6G
	 /9+uQhj+C65gtHkhSMdHN8Zln1RdXUK4c4dDQYi7HS3TRWml0lLopN7oB2i1T+a9jXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="a/CxQNFM";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fiYAkdrQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24671606A32E
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24671606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a/CxQNFM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fiYAkdrQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BB4O919603
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xaVcPCOyezxrM0sb+d8/47Ilh9xHOyd5HbtN93BsFTE=; b=a/CxQNFMriG9cGh0
	Uwrg1wb5SzG56ytKBsTmjizu7ksS/1Q0T4kwwJuAvd1obBh4CqTyVyYl1yZPcjZ1
	BGB0bbqCxYk5QEKY//XiJnzI+1COdtXkgoUqQ/njF/HxIimIG5QDWJoJ1oLHoJO5
	CjJmrh/Dau9D8pyz9SEIj1u2dXn3HJr8DSAf5lpRgOewV4Y/Ax8kdQggjZBQFPDn
	NgUIj3UFJVb5X5KitfSBdn07EYxbK8LZmUyKnJKsvAcPHyvIjtPA4Y/mNSIF78u2
	Szoy3udyy6VCumDjFWnlADcZK9aXLG/ihbcV+iJvRMJemHa2uTYw8Vv6Pn7w9pki
	1SAtlQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y24fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:20:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so6475703a91.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 00:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795681242; x=1796286042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaVcPCOyezxrM0sb+d8/47Ilh9xHOyd5HbtN93BsFTE=;
        b=fiYAkdrQhXrHZL6VakBgdD6BLt1rzJtI3xPWlFFF75toyyhLC4M0Oc1qUDtvpNirHJ
         mEZQDrtjdpc8MyqZFHTP/SdPlz5J78cm0hP1+6khbNjIF/Mf33GmadQ0/3QBJqdwikH7
         s07FuS2401uOFkcEmYAQXHrGZe05JOaM+jjiy0/b9zWqxAI4hx4CmDjfK98bEolYsivH
         g5hAd60PcbFizRCTsbpkdL2PVdkHVvs8eGJnJTXZrvw7GOWuM8h2eTQTqUVwxY3ENnI5
         iaRlrovXoAi7tCp6UWWjuZHjb3ufXHFA0rbX82muOdhBSLJ9AfB1r9IXr39sLO76tYjM
         GPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681242; x=1796286042;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaVcPCOyezxrM0sb+d8/47Ilh9xHOyd5HbtN93BsFTE=;
        b=KD+pmRsAm/9Gf1/XEL+SPuUGuSp/g875soT/tjd6yUpgNbFDehBeCrx4pyhjxJe8ox
         C3Q82F1wBolLQMDKkVdV6lmMZ/2VsvdCkW2MQoKnThVCAXsKh9abUR6ES4ZNbamTkshM
         PMLB0W4epI3dJDsRlF0PwFYqdLFQ+W32gjE43Yy445Bx4BaQAgOTk6flOJigNev6E2Ev
         TFEuqq6f2hU8Lm2UVwF13jgHVpKk/DvGdwB5y8UE01hpGG9rPJzbwLzbgDBpnQY8AIp6
         V2CYJ29ziv37MAkVfC85s7m2U3fvNzn/PLYx+UBXfbBqk8iwA6zNytinKVga/Ma1aDy2
         f1eQ==
X-Forwarded-Encrypted: i=1; AL+hErF5KbKbwMy6IorvyFsr6K3ImXLw3P6se+2xYRPwJKiKotwojzmQswZLYDkmAyzhy/KILYdqhXvtK2o0LcuQPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z81OLoOtzwcErCW2wSX+TTSJkMPxrPqAd6lAwBhEj7TdIyRefli
	TZfhIy9NNWvLJLwuru1B3iFB/BXg54iutLnNTZXiULKBAa9EL/lyXoOfdI671YPx08iAXgsk+Jg
	HyqYzyzgS+UWeRu5+3v1cX9rShUu2zAWeERannI19u1G2pddo1hT9tHuNUcpHfZ4OpZk9SQ==
X-Gm-Gg: AZFdTZezXeybWZ/wbwa4fmoh1qjZ1HtV44dxGvMsu7hRwTtZVEGvVgQ6rA3ljcQVBJx
	B56c1cs5QP//qvCmSb/ke00TxIjZk6vE7HGb+EsUfEd7Ut/7gcTGiWMAnSk22KvqS9aVDU0s6a4
	Wf4MJhC1rjL5+YoCHf7ZlI7lGlQdPMyknl8UDkbOAJisHyyDQyH5WPZ4WTPw1hhmdlJYW8cKSQ0
	iWWgnhCNR4ZZWbo0GdpCCjZwh2WBVAEj9I3MfwWC0qMmMC1NjsFIFpxIHOwauxunbFPX5IGxK/j
	crv8zpXa/0HJBrbhHi8Iz3UEmZPI9BZcOgfJntpWh3BbqzSr2FeRK6VwATqiHEsTryGvkT4ZRMm
	9E1P//mQ1X845KNbZWhgeW30+kOwbJcVBe3urpoKsCaVLFF5O7EkMQGctO7KeUOY79l1JWFzvkf
	0k4dw6
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr13137427a91.0.1795681242348;
        Thu, 26 Nov 2026 00:20:42 -0800 (PST)
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr13137407a91.0.1795681241797;
        Thu, 26 Nov 2026 00:20:41 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm34518094a91.15.2026.11.26.00.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:20:41 -0800 (PST)
Message-ID: <187a8ba4-3c90-4fd8-80a4-6d2994786f0a@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:20:37 +0800
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
Subject: Re: [PATCH ath-next v4 08/10] wifi: ath10k: trigger recovery on
 corrupted HTC bundle lookahead
To: Kang Yang <kang.yang@oss.qualcomm.com>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX6qe5dqrvHmzE
 I6YRCV5Bsso4C6W6Sv4gds3ZidaXQk4v43Z9S454eBQ0w76OADxoO3qszqThSf+8aKxTZwlP+Br
 jHdWx2KeydV+dVJxDE4wShoH51NNdio3kmkhZSxWix0Cdc6lTGSTHdJJ4lqfXa7X3pwtQUyJDCP
 AlBdjwrFRjGnZmqkU3r6jzyBKg7GFAGA5O1ErxR+whv3z7FZrR1BWUHXuxoDwFAhNnFiJpwMLV9
 h28TjEk3zEdrdRlEuk9zu3bmMttlUR9Xs74lsy4FKvcp9hFV74HSmpACn3DAQuCuyNl3pagUjiU
 NBaSVSV7zuzMglRrFMzmfCCGWVRlRYvjXCqD/Usw8ap7kits6MUNYCf+BQKBaMLhhAuaYfDdSRW
 NtlS1W6iH6roFVXVEwJpjnDQxodQG1nH66nHbFsBPUyy4rtxAK3ER7YC/HZWKWtXweszB3wsZOg
 h94SR22vC/bdOBJRQBA==
X-Proofpoint-GUID: hz4usImHn7_b_qqTYuDtEuceWsdX7_9C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX9TQmUphkXMXd
 XaWcTwx1TWaddHHoaK9hdYGF1VG5jkNTLDUV/x58PBFsEh8WmOSdCmf5g1Vay8I46P6vzyJcxR0
 tmxl6SHjp1eWiaIl7o1N42gxa9qW230=
X-Proofpoint-ORIG-GUID: hz4usImHn7_b_qqTYuDtEuceWsdX7_9C
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07ebdb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZdyoNSFhri5ofBwUGgcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260031



On 11/20/2026 4:41 PM, Kang Yang wrote:
> When firmware crashes, the SDIO interrupt handler may read a
> corrupted RX lookahead whose header reports more messages than
> ar->htc.max_msgs_per_htc_bundle. The driver then prints errors such
> as:
> 
>   HTC bundle length 2322 exceeds maximum 32
>   failed to allocate a bundle: -12
>   failed to get pending recv messages: -12
>   failed to process pending SDIO interrupts: -12
> 
> The handler returns -ENOMEM without consuming the mailbox lookahead
> or checking the firmware-crash CPU interrupt. The SDIO interrupt
> therefore remains asserted and ath10k_sdio_irq_handler() repeatedly
> processes the same invalid lookahead.
> 
> Stress-test logs show that this interrupt storm can continue for
> 15 to 20 seconds before the firmware watchdog allows the crash
> interrupt to be observed and recovery to start. RX remains stalled
> and user traffic times out during this interval.
> 
> ath10k_sdio_mbox_rx_alloc() already triggers recovery when the
> lookahead payload length exceeds ATH10K_HTC_MBOX_MAX_PAYLOAD_LENGTH.
> A bundle count above max_msgs_per_htc_bundle is the same class of
> corrupted lookahead.
> 
> Start recovery as soon as the invalid bundle count is detected so the
> HIF is reinitialized instead of waiting for the firmware watchdog.
> ath10k_core_start_recovery() does nothing when a recovery is already
> pending, which would leave the interrupt storm running, so also mask
> the target interrupts.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
> 
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index 748ba6749339..fdf19ce4b55b 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -497,6 +497,8 @@ static int ath10k_sdio_mbox_rx_process_packets(struct ath10k *ar,
>  	return ret;
>  }
>  
> +static int ath10k_sdio_disable_intrs(struct ath10k *ar);
> +
>  static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
>  					 struct ath10k_sdio_rx_data *rx_pkts,
>  					 struct ath10k_htc_hdr *htc_hdr,
> @@ -513,6 +515,11 @@ static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
>  			    "HTC bundle length %u exceeds maximum %u\n",
>  			    le16_to_cpu(htc_hdr->len),
>  			    max_msgs);
> +		ath10k_core_start_recovery(ar);
> +		/* Recovery is a no-op if already pending, so also mask the
> +		 * target interrupts to stop the IRQ storm.
> +		 */

bad block comment style, please check all such instances in this series

> +		ath10k_sdio_disable_intrs(ar);
>  		return -ENOMEM;
>  	}
>  
> 

