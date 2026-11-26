Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682281;
	b=qkg/CF5bQHdTH999qqrlVaPkA0bJHitvxaulQkjEe5zQ48766ROFgrRbV3rgqeKoSvYN
	 HZhFmOKBTwA2/03IzicKVw5Y23BaWPYNolEQrou4gwc3RERUc+f1Umn+07c5PDc1IgIJ5
	 GzZzh6YYj3LjLlhmQ8hro2KVvBtoJvD5ae3fG4EGEzzXW0Fhl9ImTvrNtWtmi+wZvgt8h
	 Y9P6ZDRCJFRQF0gTKQmR4EqkB1qzRxJyCRD6rL4MgLJ//mcHlPXtaO6ucXKXD+nNQX6Sr
	 uxyrKggLeYd/DkgoBrwIMdNp+RANROt/E4mCgQQEcpUPv2EE0pgdYAdwTMrMlya+ptg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682281;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yFKEHfBq0yH6qyz5rw9rWrDAF+QnfM5yr8Wb9TGOvFs=;
	b=WTisUF5PIDlNvqh7l+ZVctIP/vyb8Eix+GU0n9z0RjkkYXtXai70GhIyc8hTUVXTr4mS
	 HZZJddpg7FbpJK7yhuu6TqRrWvxrUetUyo+jpQG23+rwRY9wzUMB3vxr1uwmSEyvVj3dd
	 xQcjeE+WfP+Y2tcl7nL1FHgDT7lOdV7OU0+bMbRpjYP1v/b1VQHJ6DyLbacT5fJrU7q2q
	 uZ+8zXxdxdycfz6V2Zvcu8k4HJ1R8a7CbbJGGoC0nJXJCykmqgzbpw1U9ltuZm9X+1YoB
	 zxirGVZZjVa9Pj+z2IN0ZXJTAvGBY9bBnyVEvW2GK9U58PXbs/L9twzZP5aK5dsIVEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IYh90MYQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="GVTp2J//";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930A6606A321
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 930A6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IYh90MYQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GVTp2J//
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7j5GK132239
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yFKEHfBq0yH6qyz5rw9rWrDAF+QnfM5yr8Wb9TGOvFs=; b=IYh90MYQ3BooydPj
	lmmICp9sjXDYkua6k/s54aDqw+LTxDcRg6AthdPfGBeBxL4bb/fragqUeC9pXY5y
	q2FSXB7rRA/jLI08D+1qaw52bMEV6YeYEzA5Gl1jp9hwjzJV2FcsWnlizajRcpAa
	eNgzdTV6NYp9V8OQAVYp3ro8tmrrlNiVyJUjeZOR6nGyfIpqCLVFHf5O9EXmW/SR
	urSHgK63WakQeerxufqly3AxOWF+C59i22XIOTF6fvExOqecSVF3scELaNHrmsIt
	dLGl94V4yDJFrm01BGUr7UzhXn9kkdjPokYedGIT/L1WuMUtFr2TBxorERYe4QAP
	fkQRIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne06f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:37:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso5893392a91.3
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 00:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795682278; x=1796287078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yFKEHfBq0yH6qyz5rw9rWrDAF+QnfM5yr8Wb9TGOvFs=;
        b=GVTp2J//feuTS69QNBIdtWZlI9YhU1jyLoSSg+8YESjbOyJ9UxuuGNu7LfMtjo7Kb/
         k7hIFnK8dRZZ3DJLvwtdR25ZmYjGPpTn1o+Ay3TIkKTyCfCxkYM9R5mP7HLVNMDlGRue
         QuaGrjDipztDkmO0n+X+Rr0L09r7GNryypj8kGAcXXi04nrHvKwOUlNr9n1gsFHnKoZf
         yvqAstp+qrSNG1DAhnAGld1xC55yo7FqipGZKBNSW1x0Z1525Av/yvcjQ/M6o1CDZ5jb
         znDUnAVHXVOsTN9Anfb/hf2Gx5FkN0PhZW9S8ISQqjHUsvyxstTzLqWWN0oTN88L0lM4
         QRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682278; x=1796287078;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFKEHfBq0yH6qyz5rw9rWrDAF+QnfM5yr8Wb9TGOvFs=;
        b=XcyPPqE10zeoAIsSSVFtutKA8pZDjQIIQemwoBiUGPi7HOa906ULuwHpGuv2x7uQgb
         +Wn1qqHBOBCRnWBDqsO9QTF7FEfdFku6MooaIu+JaCnxsknStIZN5UtjQrRimvQuxtUN
         lHSiMEAJMXdAGIK5YDJiDxMJhmhcBO5CjbzaUPLarOlFML05g0I2L5oDO0aq6oh21Q4G
         elQ7FefNaJhFLH5t0MabjDfCWUuWVYlOxvZljISM9pT1vr4AeoWqSSzyXYt8PUOw1MsA
         i1of8fMsxDgFLlLYV/0TZBB63TdPWmS02HYqFIZkDT9L9WSUK0TXbTHMJa/9Evdxx5wz
         18GA==
X-Forwarded-Encrypted: i=1; AL+hErE4Iu8NmiXhXFkjCcCIZ3Aucxa7W6hwCfm6RFjQ5pSz4UVV2r2TzKLZ87hkn0caag0DxrLBFZxTHPUpCQmoQw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9GbiMGI8DqFHRCv0FBuJY3iJYfLvG8zEZX9uBjXXvyl+IUA7Vm
	gDixhCQanbwvjb2zci2b3/vcr9dNXOCyEBYoenFu0wwlqnNcB7oh5Evq/p4DMj4nKI9/xnspgPc
	ngi4hcmxj5cu2ICeMSsohcuttriu8RAYIQTUKqXAYy54Qxfx5nqUy4BIvv3WYRc8ygO5B8g==
X-Gm-Gg: AZFdTZch00eArGwmpGSd0rqEQ4JXNSRwLL5yHA+mx+5qVKtzBWziFVCZP966Z6V9RGJ
	9mRu660q2bJq1XFJQWuzjEVOD3e8yGYnLe0loxCa5do0DrsY2tk4NQn4vAPNdFzBo5n9sUfi3Lc
	mGTJrGfbRxNj10liW8Krf5PQszKVbn8eU5KtQtAmyD86z8cW3I0TKEmJ/I1AS6H5Orq4/UeQYNR
	klcxy5k7ya5LwTu3WM538Ysjw1rHc9MUanCwB43RqxxybYREhb4elidXEIBBMKx2pzFC0n7l1+9
	BM8cZxtgFjL2vzFF4P4oK8zOpgDRN1Y01Fhn4WFUjdDSMKh/DgYs0iDdmzg9TorbCSVPuc+E6H5
	zjHObilJ8EFCoERPgjlGrMwAMh1KZf+yY4x4U43HyPGrFYA+Lxzi8EL8dzHtXKG7au8eA8Vrhma
	bX1rso
X-Received: by 2002:a17:90b:5289:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3b41c92c416mr21023356a91.42.1795682278195;
        Thu, 26 Nov 2026 00:37:58 -0800 (PST)
X-Received: by 2002:a17:90b:5289:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3b41c92c416mr21023325a91.42.1795682277617;
        Thu, 26 Nov 2026 00:37:57 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4efb59622sm4170993a91.4.2026.11.26.00.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:37:57 -0800 (PST)
Message-ID: <6dbec0cb-ac36-41b6-9a8b-12da800222ab@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:37:53 +0800
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
Subject: Re: [PATCH ath-next v4 10/10] wifi: ath10k: drop async writes and
 sleep timer across power cycles
To: Kang Yang <kang.yang@oss.qualcomm.com>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-10-53d6a04490e0@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261120-recovery-v4-v4-10-53d6a04490e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b07efe7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QFfjU7qKHf57nAPH7roA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX+cdT7yEFZFMZ
 VGyxXDs0sLexe8m09chR28uJM/H70rbpJkvHmwS5s0hK0HQsEP8V4nr/4/r9VIHwL2U7d40peRQ
 zlZGhEzGALDF6C5fmOaUAn4F59OwTjTJJ70PcYWEEjP46KuZgwDyehp4vhLdMjbHJvLmgncpwFb
 4M9jfR5pkI0LEW68DXEvAxPAZtgalh++6hW6UNKnoxTTOmcL1QkkbRjgS1PRwGamwQ4pWNxy2N3
 Lx0d08kdwmzkDGUM8ZKnpgFLr5P+STUnGm5L6b4Oh5Q2L3XwXpLvgIRYbxh7oJKrOtuUh47pCsL
 BSiWdq0PRZvrJDTPt6Jyz0ndr+iOwlVZ+LH4QdR5NnyHJuknuU5wuCOz8XM2dQqgY4nAHOcHs4i
 0jvnJF+napYOjedFweGmpBd0K6LV0xfdxizm9dq/qCicjGTA/t3AkPPJCI9/g2JK7sU7Lu24mRO
 5k8X9aT3aJpY7Sg1MqQ==
X-Proofpoint-GUID: lyHnq8JuK2UhaBviXKk-sfbmgy1WtSSH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX8ShTy9diQYSi
 mGnKlcSGzyyTMOV097XtngcHM+aYUHn1aH0U2kfTWgWBiz0AAjKPNaE8xbdQ/3ms+4puvtXEB3l
 PzWJ6bsE8rH5utWO5w7hi9J8PqPjKm8=
X-Proofpoint-ORIG-GUID: lyHnq8JuK2UhaBviXKk-sfbmgy1WtSSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260033



On 11/20/2026 4:41 PM, Kang Yang wrote:
> ath10k_sdio_hif_tx_sg() queues writes on ar_sdio->wr_asyncq and
> schedules wr_async_work. The SDIO sleep timer also schedules this
> work, and the work may re-arm the timer.
> 
> The current shutdown sequence does not prevent this activity from
> surviving an SDIO power cycle:
> 
>   - ath10k_sdio_hif_stop() drains wr_asyncq once, but new writes may
>     still be queued before the card is marked disabled.
> 
>   - ath10k_sdio_hif_power_down() deletes the sleep timer but does not
>     cancel wr_async_work.
> 
>   - ath10k_sdio_hif_power_up() does not clear work or requests left
>     from the previous power cycle.
> 
> As a result, stale work may access the SDIO bus while the device is
> being reinitialized in BMI mode, causing errors such as:
> 
>       failed to read from address 0x868: -110
>       failed to read fifo/chip control register: -110
>       bmi communication timeout
>       could not write board data (-110)
> 
> Mark the card disabled before power-down begins so new asynchronous
> transfers are rejected. Make wr_async_work drop requests that raced
> with the state change instead of accessing the bus.
> 
> Synchronize the sleep timer and wr_async_work, then drain wr_asyncq
> during both power-down and power-up so no request from an earlier
> power cycle can run during BMI initialization. Factor the queue
> cleanup into a helper shared with ath10k_sdio_hif_stop().
> 
> A dropped request is completed the same way as a written one, only
> without the bus access. HTC messages go through
> ath10k_htc_notify_tx_completion(), which lets the endpoint release the
> skb. The IRQ disable request signals its completion and leaves the skb
> to the waiter, which frees it. Every bus request is returned to the
> free pool, so nothing is leaked.
> 
> As a result, ath10k_sdio_hif_stop() no longer frees the skb of a
> non-HTC request itself. The IRQ disable request is the only such
> request, and its skb is owned by its waiter.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
> 
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 78 ++++++++++++++++++++++++----------
>  1 file changed, 56 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index fdf19ce4b55b..f0e1feacb629 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -1461,6 +1461,33 @@ static void ath10k_sdio_sleep_timer_handler(struct timer_list *t)
>  	queue_work(ar_sdio->workqueue, &ar_sdio->wr_async_work);
>  }
>  
> +/* Drop any requests still queued on wr_asyncq without touching the bus.
> + * Caller must ensure wr_async_work is not running concurrently.
> + */
> +static void ath10k_sdio_drop_wr_async_reqs(struct ath10k *ar)
> +{
> +	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> +	struct ath10k_sdio_bus_request *req, *tmp_req;
> +
> +	spin_lock_bh(&ar_sdio->wr_async_lock);
> +
> +	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
> +		struct ath10k_htc_ep *ep;
> +
> +		list_del(&req->list);
> +
> +		if (req->htc_msg) {
> +			ep = &ar->htc.endpoint[req->eid];
> +			ath10k_htc_notify_tx_completion(ep, req->skb);
> +		} else if (req->comp) {
> +			complete(req->comp);

In ath10k_sdio_irq_disable(), irqs_disabled_comp is on the stack. If
wait_for_completion_timeout() expires, the function frees the skb and returns while the
request may still be on wr_asyncq. ath10k_sdio_hif_stop() then reaches this branch and
calls complete() on a dead stack frame.
