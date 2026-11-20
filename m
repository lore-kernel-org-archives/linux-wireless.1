Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181192;
	b=Yw86lluHBd8VkRrL7ckYLZFzqcQSHk1s0W17jUfYlJ9cakaf51zNOb1BnwmU5+gRzk23
	 0Qxa/Tgd2CVEzA6d4444HWVtsUfqSonPjc9gq5DAaWQ+85h/n7iAVTP2bIVrwU7pL2+NJ
	 b/lnPss0sG/HA9Gn0qHjHxqNE94oax1xOgGao4HvAf2Moe1xaojnqFpHTLO0FImEKzbQw
	 WsK/NbwbRe2v1rq3VJ+OtPSTI5ixYdzKDW3W3HwbdNu0qmKgkv2X0QCR+q2q5ywGCIZH8
	 22HEZryx9hoGWrjtSB6b4TyxJOQk/nRCCYCIJ2B8x7nM/LYjifjDYme+bnxKkYaGJ6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=guyr94lwtT4HUWbL32yj9P2Kvwo+CvFhkMLt90cotQw=;
	b=fT1aWL5LIVcmOxwGdv5k/ThClLhpNc8cur/pevxNA7MHJQCpAXcJrUpZu/AnCceqSLUB
	 iQtvLH5mXegsRczBUDUdFekIeZD+Szj2B3eVC3auQCF8sGvsGVxXf7ZKTu0LlpIo9P9gL
	 hyJ08DoZ/X9hsPmfVWp3AzKPuylKwRBPvY1IO6/7JmolQYpOFLEkL9DJBZHLXmCaHrAgY
	 459kJ9QhRGqRG7R91r0UurPMJyQkPqOeFh7AWhRL0Uq4eVuSfFIQJXOEM9yjV8I3vUbmu
	 V4/S80mokzUdxY7+XEqnMl/IVrAT+1xCojkt91c5aGQ3RnbIqc1sGY08vhtG9jzdZhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwQDXvg0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jaE1MJe6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951FE606A335
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 13:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 951FE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwQDXvg0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jaE1MJe6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkHpC1017120
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 13:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guyr94lwtT4HUWbL32yj9P2Kvwo+CvFhkMLt90cotQw=; b=CwQDXvg0LyggqihZ
	EyN2KmQUQhw66VZ49OxeSUVN/TqOt0ZcSx1f4gw0PY0q/82LuDcuVE8jqPBvul0b
	uiQcuGiqbpfRauwwMXlrUw2SkkRLVsG4sorz7h4dkXE61+eRxRPAHqNJYrGR0J27
	d+5Yu67PRZB9GCq61m1Z4iaGbS3IFPDSolYr4FGizg25R94HAHf+aGInvtNklSUX
	wLELFTcMXE3CUv/b9bPYsXpZiKmFsPlJ7YZ8nDvFxyum02NxmPB0cdBXJ7JaiVBd
	EhHvwRlyEIxinHhX2NPr74fyN324/jh+Pb714TwlMqUSUEeyKjfGIW7P0KE3WxRm
	0dEFQQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqsrga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 13:26:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so1129822eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 05:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795181190; x=1795785990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=guyr94lwtT4HUWbL32yj9P2Kvwo+CvFhkMLt90cotQw=;
        b=jaE1MJe6XPob0wZLVOHHhXBJIvH+cVG35D6csv15NqERrHpvPl5Pjzj/Ez4mpnsGwp
         /lkMgFmJ3qE7dxd7TisodYRM1v2MAirnusxrB4y7xFbebzUoklxtJNymiWgaC2aeIH8P
         N/2DrOi0vOV04z+aMPQaf5T9eyGgtywmdvEGeSAb0pXstwDXqPCSD7j4c59n6yz+X4Di
         ct2lP/DX/fYhDjA0pnhMmc++lQirNNlG3SWIXJ5sbpUULDmnXjmb0lY94u1c07RYnVkY
         yvbRwnOb7wePU0Hg+XYkpowvkn23lvCCx9hasI23gn8Ww7TCtt90hRWJu74tCGYCZ6Hi
         b7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181190; x=1795785990;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guyr94lwtT4HUWbL32yj9P2Kvwo+CvFhkMLt90cotQw=;
        b=fza+MN6QF7w9WBCfAiwMPUCtjHTLkw4D0faNmD82RagUp6vgKCUmXHLbc/pFwgguIU
         DfO8PaAXdmQm/SDSm+1ph3JQmFOg9VOMBfB1sYIdmB49iOSxBN9D9WflzRPzI+BiJrTs
         BuZ5GKyOkPjZBctkxTm+FdCPBB6cK70PWQOJBBONIea6IQaduch6rN1unAJ/XxqC1U2G
         6hk3HhubUbQNdWALq+lP6djpL8kez5QCqGhO2IYOkBsGQSs2R2oESDNALVgGsvcc3UwL
         CVjQPA83cVBtjh3p7Ppzt+xPv+xJ0SrqyaKeDiCgkMAWWWzGEl5ZESDJ4MsXSFlrB1wW
         T9nw==
X-Forwarded-Encrypted: i=1; AL+hErHLVIER8NrqUw9GdR7trGGULC7iaTUFRFsRe3M10R2RpzLti1+c3ItBxqYmb+aSN71s3yR2loFcNBiQRuTJ4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9eTNJSnGINh/VCNcymgGqyFZu/wh1FitrCMVtkdbS0G6ETDsYb
	SS0y+R/Ilp61PRIzN/mHfzekQDOpDgA0bL4V2JYok0A2/QBVihtlPkmO4JxCD3cfpuS7gDTKQH1
	T0GN3NnCRx4QIRNt+VVj2SLxLrNeLL+T9+y7LzOQb1+ID75rX7DLXbUwr4q1y9MOOzH3cqQ==
X-Gm-Gg: AZFdTZdetdjD6yA05uoF/Z4wkt+6+js3D7Xc+l0Asz80iOtIpkpuST/dLUd2vPLK/Rb
	TFeYIoeawqjF2SDVqscAaZe5mgxXP40Bp4UsMANJL6CR9kVobTL7tZiFEz7I54RxvV1A2G1rIEh
	X8Pb3oritDrVigg3qCJQiLEwJMdjLSSvPecZUkaMZ3T4BTC3LTINc7N4KsklRvETgKsZzsEKSaA
	Yzh5lEOZbUkSsGikC1lFTfQUmyuiCYXACCJMCoOLo5joMFVYnXPbgidWvhRD4ZSu16V7PrI9oEH
	TIvU/8yvfrOMbgs7VdmnrzuF69WoFqfpMKxENZVqDVbBv3wfYkHBzWh5y/W6TaWUdgzpubo5UMr
	/6fA2oQEjyaVqVTm9eEISMnraQ4NgvrDLlJXMYIGYXXI4nnkCRBBUhx8j5O6B+p56BkFGt44zO2
	HQ4R8JU3K86XouHo2r
X-Received: by 2002:a05:7301:929:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-38570f25262mr2562919eec.31.1795181190020;
        Fri, 20 Nov 2026 05:26:30 -0800 (PST)
X-Received: by 2002:a05:7301:929:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-38570f25262mr2562890eec.31.1795181189475;
        Fri, 20 Nov 2026 05:26:29 -0800 (PST)
Received: from [192.168.11.103] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm9479753eec.28.2026.11.20.05.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:26:29 -0800 (PST)
Message-ID: <6c91ec31-d17b-4ab1-9031-f61932c57dfa@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:56:24 +0530
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
Subject: Re: [PATCH ath-current] wifi: ath12k: report TX status for broadcast
 and multicast frames
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20261116230250.369383-2-ivitro@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261116230250.369383-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX6318pPr3WER4
 bi1U17Gko+dAvg8JAJzAYVymx0qS/4m2gfRyefIzlFVp96IVY6PEl6OucSayzW6CPiPGrLEoLYr
 ZanNb1f7BhGrH1eG7ckH39AFacYXaC/WGXurOV1W1p3jBNGJSaFaxVFjDYiUu7mxDYcpeVmH3eC
 ce+i6rZxHWpSvXnAdravZHzapagpXGIy9OOhIzOa1BFXa0/S/94NLnRK4htF2Ty5OLqsRpz03Cq
 Ihf9MX2NJPwGr6dHOjE/nZWZr4cBVDthnyidR9RwwNjx1K1xBzuefWtXfnly0HbE99VnQTwCcjs
 LjpRJ3eJ+j33n1dcuUmHUxhpN5lO3qRTpyPNDLN70TjyfZD2QTJy7YWIuubefG0IwC1r6t8ImG9
 9/VuXhxdL1bskSqG5A0trztj4a4lTyZpWx4giKtKuC1WFJ3Gj3J9IXLec89SNZhmrqJ3HK6TABL
 Flkj3AyoRgdTcPNKJkg==
X-Proofpoint-GUID: 3bkhJeyA15n_zK5rPAEk8BIbKR6Va943
X-Proofpoint-ORIG-GUID: 3bkhJeyA15n_zK5rPAEk8BIbKR6Va943
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX6GPS90NsLwZs
 Uh6KxomSr8InZx6cYiCtWz+Uzx+949e5Ie22MKVed5KCxT4IBQSTaHR2njM6rWty2c9aszp6ijZ
 EXVLhaPmoo32Ys9axVmxCd6r2MskL3E=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b004a86 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=m8ToADvmAAAA:8 a=5RRWBY4WAAAA:8 a=bIduEeDIxUt9zr8lqoUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=kCrBFHLFDAq2jDEeoMj9:22 a=drtMOSl5Q_Tsf-UZi3mY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200053

On 11/17/2026 4:32 AM, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> In AP mode, once a station is associated, broadcast and multicast frames
> sent by the AP log:
> 
>    ath12k_wifi7_pci 0003:01:00.0: dp_tx: failed to find the peer with peer_id 2
> 
> These frames complete against the AP's own peer. That peer has no
> station, and since commit 981050b918fc ("wifi: ath12k: Fix TX status
> reporting to mac80211 when offload is enabled") a missing station is
> treated as a missing peer: the frame is dropped and an error is logged.
> Before that commit, the TX status of these frames was reported without a
> station.
> 
> Report the TX status without a station when the peer has none, and add
> rate information only when a station is present. Only drop the frame
> when the peer is not found, and log that case at debug level, as the
> HTT completion path does.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 981050b918fc ("wifi: ath12k: Fix TX status reporting to mac80211 when offload is enabled")
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
> This conflicts with c752394249f8 ("wifi: ath12k: store station pointer
> only in dp_peer") in ath-next; the resolution uses
> ath12k_dp_link_peer_get_sta(peer) in place of peer->sta.
> 
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 23 +++++++++++--------
>   1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> index 41abf1865702..794d85d9dbaf 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> @@ -856,24 +856,27 @@ static void ath12k_wifi7_dp_tx_complete_msdu(struct ath12k_pdev_dp *dp_pdev,
>   	ath12k_wifi7_dp_tx_update_txcompl(dp_pdev, ts);
>   
>   	peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, ts->peer_id);
> -	if (!peer || !peer->sta) {
> -		ath12k_err(ab,
> +	if (!peer) {
> +		ath12k_dbg(ab, ATH12K_DBG_DATA,
>   			   "dp_tx: failed to find the peer with peer_id %d\n",
>   			   ts->peer_id);

I'd still keep this in ath12k_err to catch the frames that get TX 
completion without a valid peer.

>   		ieee80211_free_txskb(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
>   		goto exit;
>   	}
>   
> -	status.sta = peer->sta;
> -	status.info = info;
> -	status.skb = msdu;
> -	rate = peer->last_txrate;
> +	if (peer->sta) {
> +		status.sta = peer->sta;
> +		rate = peer->last_txrate;
>   
> -	status_rate.rate_idx = rate;
> -	status_rate.try_count = 1;
> +		status_rate.rate_idx = rate;
> +		status_rate.try_count = 1;
>   
> -	status.rates = &status_rate;
> -	status.n_rates = 1;
> +		status.rates = &status_rate;
> +		status.n_rates = 1;
> +	}
> +
> +	status.info = info;
> +	status.skb = msdu;
>   	ieee80211_tx_status_ext(ath12k_pdev_dp_to_hw(dp_pdev), &status);
>   
>   exit:


-- 
Ramesh
