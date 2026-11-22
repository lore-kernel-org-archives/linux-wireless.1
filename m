Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795357972;
	b=eDuf+/5ekSveWfLCwSPUuJWJBQpLzPfxF6hzdoDPo0Rf0Wr7ztbyBcjmHTWmiqeaxCMz
	 s1qq43UpyhiWiRKzXlYOHaJZ8GIDEFMiJmQcAvmqS4YkPbMaWy9CRl055yFYHcWFx1V8X
	 L6zIIqHuxbRIP/sytUXhnjH4eK+UoXb2zK19MtzPmxh1+k2Qu4m2sxwRBIASLM8QdFjmq
	 LqnbM2mySStCh1+Al5Z8+orZqj4RyT0VVg1kL/IJgzifoOkIgSE/CvmE1LDH6EQsTjZ0n
	 LY3DRn8DGOHEYq/BmjOYDlTFNmlBp/yxy9g3MJSyOr805EkvRvUPLq4TCZ8SMZkHXZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795357972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=;
	b=bF/4jDdWZuSd6gbMfVllSFaDyQxyKkXEcf6HCszgjoTTbCjE9FznIWGIF/Oz+3aTjgfa
	 DrDvkBDStdzKoqps3+Z5KlhlWpgNRYM6GhXQUrgZgjRoUjUlqr5AiP35QEBATw5633gm9
	 TLPffOmYUvFmm6HL0rIjQmF41+Wrmh7G1+Yv1wY/1EYxYgkwQrbbM8BMR+jRQ7l0gLSC3
	 gEM7rihgE9ihDn3cJYVSVp9OAPS7uh0/aeD7H6e0QxPcmGTqyqSE91HhfRT8Q7k+7X2hd
	 4Qdru0geiuSEiI9OKMdsmHUpNsbNEE5WGjw/a/W9hUm9N3+kPP32iseicFnL4b7i4Zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U/ma3w2t";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gT9xjznO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B8D606A32A
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 14:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B8D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U/ma3w2t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gT9xjznO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMBmUpK114610
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 14:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=; b=U/ma3w2twbrJoREq
	27Drh2qPZNY6/4UUBWGmfvnc454xFXTR3G8lTQPScX79StZInIFoEUylYjNt8gAf
	V6MQh9O5REi7H6uG/pCviJxpTIOP+ATWyK24XsFTRZ+CMDfQITJmGWPZplEsUN6V
	1sD8/Vhh72mA7WV5SUqEMYuZ4zt7xqJL63G1EhtVlDEpY1fev92QgVk/mD/uLbRh
	3aHmyvB4SVo3uOlCl9fVKywsTfm5mBXBKJooPUJqo5oETjo9fh0ebzn5QFK2kdIA
	QIOoR61BG9HRXaH4fTVU61R7PRtD4DqLo1wQB0uh/DiA8Fm5JY9nvcNi8OA9zMQu
	d5i1Cw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j310fbu6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 14:32:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-921273a6cacso38142876d6.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 06:32:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795357969; cv=none;
        d=google.com; s=arc-20260327;
        b=s9iVQWtAs9B+FWU4l84Tsm3Z6UWGPz23PgXB2o0um3MLgmGUbsgVlTh1EAAB/EHU1P
         i5JC4vIRT89eUy4YKPgSogk8udke72GgnIRLN6UpccM+/m0lUnYeXG+iDi4Zyf+T8zBN
         PpRNcNt4EZihN1Nj3MJOf6osmvE1OC1tRSzBRE4rPcavSmes/y8COFlT0juU2EQPdQ+5
         um6eR+mKdz46g6hGIutETn2cTBE1YV7orOEBuGsAHgE3nBgWeFpUnldGo6p9k5cwVpqB
         KdKad5obSzTDFUfYvRbLszN7onxepaRv4aR98M3puYyllfzNHohaDZzxi8cvxZyELVfP
         cNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=;
        fh=rSQHNhYfugXAoZxOu/2CPO7L6zKWmb5RXD+yA8Wz+rQ=;
        b=IP4TiBDWDoF7rP4iyKJxBLYk2faPm8GtGoShKOHNas9J9Z87fVgNK7fggwtxWyX8XT
         FR1IOOyRVK/DwJ2cZs49/bu11HxmOJnKDcDvuSBd2rcsAAjgkybV/2q2pis5GVjyd00e
         LUX8Yhav2NyfCe6yuW2gZPUEltx8+Uc5+7JMFsrm/GueHDlovmDU7X3siONv/yxmyZvC
         /GFMW32YnD2qATRq2K7fnwkgArI069aPmjZin3ICPxNc3YsY/xejhf2z4yya9pBgE5hr
         FqVZvqi9ooUzz+XZpQGQyWxbypntZfO+M/WwnW/fj8Jt+kEX6w8aTaW1NITt9AETHFFY
         1u3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795357969; x=1795962769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=;
        b=gT9xjznOfCd1E2Cs7QPDYOdlufiz3o/9Um09u2i58XH9j9c+QbkH/G3ulgSjYjI6Vz
         f5P6GtLAqS+hozLELcWyfBYCH5L2zDshcWBNnZjJ/K1aTPDyHE5z/77GSry/CzVUQYX3
         qbg/NT46LaNyNgfJ2mLC9vcLeaVh4PcbqNfbgVheNANgkL2BlopYpe2zHnyzPoZLvEls
         iB3kKhknDRWNNG3CoNpArlzHFPG5dMr7WG/7dscQSyH6WxI5V8Un+PZOWFYCJDnK+KYo
         K8ltfXgO6yfOiQDMLhYHpo02dwEEm9E/Y7/Tsl+oq6X2x2IACZJfUg78E8vvOPJK8lX+
         orpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795357969; x=1795962769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=;
        b=yHxZAx0HTveK2PSjzCv1hYJpyM99qQvLqgjAaYDyHbH8MH/zbmTnglzZ1phuYJrh15
         Hkgq8aRhqkPukkV+lDlx2o1yTTy8r8DGqqS8RqUwHnTdNA/9HON5GsBZ+tQa/Ct8by1x
         b7uGl2za/4Hx+W4/z1N4fZ30+WJm3vwr0dOAvPI6NfXxlkSDbbU71EWMBXeBX0KLrQ3L
         8ugmlbB0qy30TPRnhiN4dF8eDyZFb38NM2HLZnW3M+ADpEifxAiJk4/bnMj5JyfGrmkF
         xFLPGLx260fty80f0B3TZcf3lBkSgUbNjWTeS65vGkJy6wsVcL9BgpaG0eLAAbrRRrTD
         dzpQ==
X-Forwarded-Encrypted: i=1; AL+hErFFbTnJDruf0u5s4GFfcfszSlZHod4BhlntWNHXubCR/Gnu4Gpy/Fu53UMa+KWf1g6/jUzoy/G4h/YPiB7a3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Gc9ydVYV0qr4eaAEm59yS63IckVpega9l5jX99kPw2WRQp47W
	bj+q3fUkxAgvBxrltMeeD+5N5I8cj/Gz4dJlZy0K6AGJnyU6AxzFqmuEYg2+Ds71vYMnuXr/4tV
	a/Wz0pFpc6cdukrLD7ZFyinZqpBYN06dPqdYs/pE+U43mVRR7FqMp6jDaYmTwNVjs8sOBAVDoPl
	jtxhO5s31nNUmJA6N49pF5VtyUrOOWsFB4RAX4gXZWucrx
X-Gm-Gg: AZFdTZfEuLlaiNlaCD2sHGqrlncl7Xq9xNzuydNFuPHAkuYI4xV6+RVi3u8mXgeKp2P
	CYnPgtRCMCNH9qIwTv8Wt7Ix5irkBb9xRsccNFdsNuONoG+kIerIDnc+N+khuo/APtFsx8jHXpU
	ep3HpMShcL0/oAuLxcPb7ObHfyIKGfRCHUXwVMZ03jd7vs0PxgfLT73gFxMrvw+s/ZgBhbRGGnp
	WGEaAERjbAUum8GUqa4MzVvmheMB/mKpPHlS0L4MD6jLarUZ8fzHojsKoXn0xtFMu/1omoj21bg
X-Received: by 2002:a05:6214:8587:10b0:921:21d8:9a37 with SMTP id 6a1803df08f44-92134b4895amr113826576d6.51.1795357969167;
        Sun, 22 Nov 2026 06:32:49 -0800 (PST)
X-Received: by 2002:a05:6214:8587:10b0:921:21d8:9a37 with SMTP id
 6a1803df08f44-92134b4895amr113826306d6.51.1795357968667; Sun, 22 Nov 2026
 06:32:48 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121175402.644803-1-julius@bairaktaris.de> <20261121175402.644803-2-julius@bairaktaris.de>
In-Reply-To: <20261121175402.644803-2-julius@bairaktaris.de>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 15:32:38 +0100
X-Gm-Features: Aa3M54rRC31zGyviv_2bpLiuSIAJiwsZBKXXauC16U296yE_pKKkHpVeSXsA4mg
Message-ID: <CAFEp6-2bg_2o_bjNNsAA8WNUkL8Xng-tMoY5awJa_OeHd0rp5A@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 1/2] wifi: ath10k: release the PCI interrupt
 mode when probe fails
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kalle Valo <kvalo@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA1NyBTYWx0ZWRfX69WSZRkLXBJP
 Q0IqmcU7ehVuu/UG8vNK4TVljc38QriitOIyW3qv464dJigaP3QIjV6yu6JPf5y0fDVNua7N5WZ
 feezaZJKCqK14qB2+U9invzzG2Z6rY3OeSKA0/1CjjwDGduwZE6WTFKpF6ZjeAlrQ4vRxxZ/HUb
 gRRQ1okXzA7ABjadYgRa1pVnYRMjSzMxl4+AU1AEW+a7ptDs0LWmsYQ2NFsamazUU3FJCZPvRYj
 3sL9nrCEASo6mkKF1b6WmSyqBYaHW7B9ptOMxT85VvUTUEAvTxkjtMFP1QTHUiy9ziWIKfSJKV2
 swk4wihgMKEW8CQsViHHO+7ClGNovEEpVQMS4VkQJjm17IT0bz+XPgtkQ3k/lto/QugG9DO3278
 L8Pz4jJBXZ8rL7mAcZQYGUy5BcuBsIWJf4NuVnHO9Ptd5+FHi+7XzuvQQUaimzbCBJW/razIHlG
 mmx0L0JkWUlvKTIJlLQ==
X-Proofpoint-ORIG-GUID: ku0LcOJx-qnHzf6SSF5gtHTs4Z5K5rRw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA1NyBTYWx0ZWRfX7nPRErn0OJe1
 uJoXl4SHnrkPu9ci6i3MUjv6HlugEZrgPM+L96aAjB7jmr3m5M7WkeePf/JUWvPw0avb86F3bN5
 r39MQvgyEY7rL+RH+sl88F5sPlLwNuk=
X-Proofpoint-GUID: ku0LcOJx-qnHzf6SSF5gtHTs4Z5K5rRw
X-Authority-Analysis: v=2.4 cv=UN1Ijyfy c=1 sm=1 tr=0 ts=6b02fd12 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=zoG6pt3vYd9LuZ-_mncA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220057

On Sat, Nov 21, 2026 at 6:54=E2=80=AFPM Julius Bairaktaris
<julius@bairaktaris.de> wrote:
>
> Since commit 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB
> device probe") the err_deinit_irq label of ath10k_pci_probe() only calls
> ath10k_pci_release_resource(), so a probe that fails after
> ath10k_pci_init_irq() leaves MSI enabled on the device, or the legacy
> interrupt enabled in the target. With MSI, the device's MSI data is
> released at the end of the failed probe while its vectors are still
> allocated, which warns in msi_device_data_release(), and the next probe
> of the device hits the WARN_ON_ONCE(dev->msi_enabled) in
> __pci_enable_msi_range() and falls back to legacy interrupts.
>
> Call ath10k_pci_deinit_irq() again before releasing the resources, as
> ath10k_pci_remove() does.
>
> Fixes: 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB device =
probe")
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v2:
> - New: the probe error path left MSI enabled (found while testing 2/2).
>
>  drivers/net/wireless/ath/ath10k/pci.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless=
/ath/ath10k/pci.c
> index 335bc7c488e4..4843a41ea801 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -3716,6 +3716,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
>         ath10k_pci_free_irq(ar);
>
>  err_deinit_irq:
> +       ath10k_pci_deinit_irq(ar);
>         ath10k_pci_release_resource(ar);
>
>  err_sleep:
> --
> 2.53.0
>
