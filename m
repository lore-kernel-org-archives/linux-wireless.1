Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602930;
	b=lUEzQS+8DCd2cR0QYNXGBsF2lr3Qr+KNGXmZjMPWmRcfQYbSYiB3/IIWnI/+S/S8aYta
	 jGTVOH4bXG3/EgONyNFKBTGwJ7N4/4Ud6wyhWcl0aU2U6c58oRSOag6K6sYpel/AAUI+C
	 2RFVJ5WIvZidbibgn/HBbQ3EdywCQQbeMS9SwTMtabs21GH/+/UTiRqOa4ZKm37nwN/WK
	 eKH7PUgRG63BVKsN3ZK/Mru+aHrwdvdxdrQzBvreKtj3Mv56eXKgCTGSU7+gU+0Dlt4nb
	 KqVetLvo3Lbfa7oTQyql8ZKcPXMMY3El5l5z5kQA4Scih8SyMZzsKedfBnHRV8luiRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=;
	b=WT5MOKSQkjsMZDT0DBMjPX1KpeBZ9b/UplWY5YZlDBwvgTN9dACvfnQ1Gg3atMUkheEh
	 LPtz9e1l9+SisBz7y8Aq+iIt9SEJkHKgGAsOSDJHWir3Fw+bXCTKECfBbGBGyyumlVV7V
	 bJvFebZ6X6iLl1dAM8Df+72PjQ54PW0zQfTC52krcsRHke0OuQS0P/U6m0JZpp4wSh2NN
	 v7mayWtKl6cCY9vt+sLumJIl1kFIDh7pm2Nk+LA4+Ffbv2KFIndZ02mZnqSaF+zwziNQb
	 YSxT261hI/aZIOeUWAAVhOKxlcKkVIEA4ONYQiM5gS9ZwzRNh0W9VB3GU9HREwBiiYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPS8S8Ii;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgkaCQ+j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB16606A321
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 10:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB16606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPS8S8Ii;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgkaCQ+j
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mHpV4131158
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 10:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=; b=kPS8S8IigwGwHRGX
	S3Zsyb2MOD8LzaMZmtRaGhenxVSZg3ws2mnfSLq6/b7sCEhuK56sZRtoMbhTHWxV
	VSY01FTKZ3U+1F9uj73+Kyc9WLR3iHq0x9dl4w54ZGuZedR6eD4gG1fYGcckN5uI
	XhEuH+cinRpmOnzAaz04ZBYbrgsKur9f78LY5sfWld9wQWRjMZaaUIWIkFPCK4LU
	/eaU4AS9QThcWtz0HjQm3WidZRCXqEcVVegn/R9gKFYGcR7hS+eeJhmwhGwx5qRA
	+q7vgEDGPNGVaXzy+OC1lHabZ0bM6FbzfpcpacqI/ha0fj46EOOGkO9J3+lzyzii
	aZG0LA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrdej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 10:35:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94967c6d4f4so611362085a.2
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 02:35:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795602928; cv=none;
        d=google.com; s=arc-20260327;
        b=Js8945bog/uNkBlFTdlx3ALxiqv6nZkc8GNUE44UYggPLXitkZIFIowtn9gXbkV2js
         Dugsz+5dhvny10o2rmy3/4jnOASD5p5UHPhR0uyQPxS/5awO35YeXibP8HM9h39KKr8A
         WYN1bSIQAct9e7mfAaO2h7AjlZPq/MUWTKFlGZ15G1OCXch7aQsgMenCy80xwTeBUAHx
         1wlMSH8ea+R8I+j40BTmtkONfubA+cgScyc66Zs3ONcz8UGGvXzENmuOExpqpl2U725I
         fC7kz1fO+4afFdiTktAL3/ULnVxrH5P3atVTgjP3kXqeKgjl9oKu1QjcDG7/z1hMfG3v
         WQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=;
        fh=cfuk0SCjcLzo1OyKaZOnlNGIlp0sE1s6fttIVcrxzt4=;
        b=IaIKgCIi51TLo9o3wlG2N1toZ1OwZyajfKogZqZWHyf5Rx8WwWz6hGM/gMYDcD0ZuP
         ufXoghIjjHIEcvq59opO6aIPt2Sz45uWObLaOWLMSmB7GafLB58LvBR1LZqo2mAE5Yg0
         6dsG+YoHTdAy2Sizjo9p3UhrkHj01rKqZ8XWPK5r2K5u58ib9CA22Ve8PqfuBg9Dp3Wy
         Y3ZN4JdqGAv1ON1kh1HDYKC3kn/9CBlWqATYDByu5pwLIJJtASRlKrUudnRO6bA1SIWf
         kHiAAeQ9xyz+LelNNxLtlxjEc3zSg8Rh2kp/zmJloCguGsGGiwBCveFlb8bl7yaiCcXf
         bI7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602928; x=1796207728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=;
        b=WgkaCQ+jmbEeceL/Y7/bwqn1WXNgzubFaYXiTjWZw7w/FHHghXEcHO87W+oUdZJqGu
         y+bCW27aM4uzEyvNyyLQa+va9Q1lqPttgq+3YklTOSMEiWdyntXf4fOa7+9UNHQWlsrK
         MXsl9Ben1IXXPDMooBWcpcGz5qf9MdZo7aCih5GKRfkb9rOVQ5nSNEoha2f18mrNewvI
         s9VsV/xFVZO/8huyOCAx96PVeJjdQx9UP/2LzQ7U/Um7MeDFzLq9sOCpBm0JU++Ax6IH
         +1ZsyUkVOdETEQDohCHAvkcMplzDYRgHdEP4XSt+nRBsYCIzi/1JjEJw2VUZ0ggm8auP
         dA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602928; x=1796207728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=;
        b=d/y2lxw8TEasV/XzUEBd4nMtNCBpLm6/vIVx/DE76qY5Gr41c4VGRLX5rqmnvpvUQX
         KP2Vv8MSMUJlMVzsz8h3UBwTy0TMx7+O1dIjEi5CJes72dAWjEAwZj3Vw7pGXtZErpkI
         8AusHXptHymcp4D4gvCMhYDuGs8pe3SCopb/gNxduu3Y7f9vDgtb9kgrVwH2W0gtQa95
         3B7OdVMwKDBFtdZEDJJ55K0hdUFqnyr0+dm5w7xKPR2YU1E4ZJIvYOJAMsHev7R9zoZU
         aaXPNo4mXI/1bl9NFOAm0KOf5SlOnvXt5rtHPEPfUAX4ktlnDwB6lz5u66w5ynunQIx5
         FMzw==
X-Forwarded-Encrypted: i=1; AL+hErHVSp91EXQZJDa8SFDzXxD8cSCgSElDTZo3mIqchFTp9cjflBfvWxX1wi/KWmtOYtk5tBQPnkzeXvhKCbloNQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9uQe/HWDvOellNrdFvRuCAloroAlJc3Oh6zwkywwMHFU5jDFl+
	Fi1qCBb3+rObSCmILfy7FXQAsB6aGpb+24cH0FkoTvtwtnpfO0jlOliiP8RjvcUJB0/v1h8dM0y
	TiahgDs7SgpKYMEkZTboQAe0GP4d0OYqDPOeZ9/zk1Y62v9enNlhPtQakutD/09mTtBRMTOAfeh
	awuXHP5jn0eeqSIZYOIUue5scPoLkkgDqZbXP2UWhRUx8G
X-Gm-Gg: AZFdTZeK+O3KmUb57slyem3Z4drDhB9Zl3dmCiSF9xJLKNTepRmVR84hczXR7awHvNq
	bdwMznBU6IHu6a10dCpWytWtOvoM4VSQPeU8RSOerX5VNvizQtj0S6+RvsZXczqL8nQVvKdN+Ng
	VqsEQGAS150gpicPa0B8wD2McJbVWHk1rtJQ37GKKeLa+8buxdSGcNoNleUN94nRuZ2nrN/YHRc
	KY40nQj527b8k75zkyABZ2K+kKjcgZq7zRURyYdRKfplBF6FsX1rJIHQ6sQs+FA/57HjptA+1Q=
X-Received: by 2002:a05:620a:4543:b0:949:65fe:b727 with SMTP id af79cd13be357-949ba9b99a7mr3132211185a.26.1795602928382;
        Wed, 25 Nov 2026 02:35:28 -0800 (PST)
X-Received: by 2002:a05:620a:4543:b0:949:65fe:b727 with SMTP id
 af79cd13be357-949ba9b99a7mr3132207785a.26.1795602927857; Wed, 25 Nov 2026
 02:35:27 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com> <20261120-recovery-v4-v4-4-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-4-53d6a04490e0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:35:17 +0100
X-Gm-Features: Aa3M54re0FQ_0fXLMt1bXHOoqkxsP0SiwM0GqLy5xHbvAlYSumBJKK5qN-6KKNM
Message-ID: <CAFEp6-3zK1=Fsrkmtmuq7Q3xnNMuCE1R0J8Pe-rAJun9igCcJg@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 04/10] wifi: ath10k: also wake remaining
 blocked waiters
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06b9f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=pfe4PHYFt_2W75ZQFz8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: HGdbROdu4DXtOTn5m5U9asTtPzc9pCK1
X-Proofpoint-ORIG-GUID: HGdbROdu4DXtOTn5m5U9asTtPzc9pCK1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX9WrMF9GAixjx
 lGn4A3NTYtNfQI2zs82NxkVqVHp4AddeIOBCWQAhFBv0RQA28orkzCpO/tp438Qlc8hXeYqiLqY
 gFDrGPZcIfY83xLnAPLubhdsoNenHwc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfXyNniSoS8Ue7U
 oYwqCkoKPUo5yYdr6HRXQVsNOSLnJWUmCwPLwH3sMs9U3sq/WB4sxJ4wO5eYsT62R1EIXEPUEYN
 9QW3UIgV6xifAV5AK44TSaxcR6ZBJoGlBIqlKbPgE7T2kub9BIrjmT5fxHSa5xDKFVzFNS2t/9z
 33BHmwFJ6uCfB323ZZjtKZVxWvHETTltbWcBpxQhXEATapFoa5Ycm8uBYeu9IBSXGi0rLXkPGY4
 uRyAMfltArGEG3gg1MY4d3bPJEUkHAqadBHMAVhlQSYMBWvJs5oSwgEGemyW399EW4e1RYm+jHO
 G23W6zwf12wyo511I1YZ4kueuzex/Pyg+k9UnqOcPRB4lC3MmWoDCjPn8n1gj8W2jLgXRg5iUNh
 MpHeRi0h8o09/FWzArJAk+Zn7NV6e0qtjKN80F8QGjwWW/2pOJCvJDwNVcd2ScRDI4vSZ2eSuWU
 CLbvoeRZiem6lDYwdJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041

On Fri, Nov 20, 2026 at 9:42=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.c=
om> wrote:
>
> ath10k_core_wake_all_waiters() still misses several completions,
> leaving their callers blocked after the driver has given up on the
> device.
>
> In particular, callers waiting on peer_delete_done, target_suspend,
> wow.wakeup_completed, peer_stats_info_complete or wmi.radar_confirm
> continue sleeping until their individual timeouts expire even though
> no further progress is possible. The WoW and suspend waits are on the
> suspend and resume paths, where these delays consume watchdog budget.
>
> Add the missing completions to ath10k_core_wake_all_waiters() so the
> callers are released immediately.
>
> peer_delete_done is not otherwise reinitialized before every wait.
> A completion left signaled by recovery would therefore make a later
> peer-delete wait return immediately. Reinitialize it before sending
> each peer-delete command.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 5 +++++
>  drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 3bb4d2742c30..99960f12dc66 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2542,7 +2542,12 @@ static void ath10k_core_wake_all_waiters(struct at=
h10k *ar)
>         complete(&ar->install_key_done);
>         complete(&ar->vdev_setup_done);
>         complete(&ar->vdev_delete_done);
> +       complete(&ar->peer_delete_done);
> +       complete(&ar->target_suspend);
> +       complete(&ar->wow.wakeup_completed);
> +       complete(&ar->peer_stats_info_complete);
>         complete(&ar->thermal.wmi_sync);
> +       complete(&ar->wmi.radar_confirm);
>         complete(&ar->bss_survey_done);
>         wake_up(&ar->htt.empty_tx_wq);
>         wake_up(&ar->wmi.tx_credits_wq);
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 74aca0af11c8..695df1821e5c 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 =
vdev_id, const u8 *addr)
>
>         lockdep_assert_held(&ar->conf_mutex);
>
> +       reinit_completion(&ar->peer_delete_done);
>         ret =3D ath10k_wmi_peer_delete(ar, vdev_id, addr);
>         if (ret)
>                 return ret;
> @@ -5897,6 +5898,7 @@ static int ath10k_add_interface(struct ieee80211_hw=
 *hw,
>  err_peer_delete:
>         if (arvif->vdev_type =3D=3D WMI_VDEV_TYPE_AP ||
>             arvif->vdev_type =3D=3D WMI_VDEV_TYPE_IBSS) {
> +               reinit_completion(&ar->peer_delete_done);
>                 ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
>                 ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
>                                                  vif->addr);
> @@ -5959,6 +5961,7 @@ static void ath10k_remove_interface(struct ieee8021=
1_hw *hw,
>
>         if (arvif->vdev_type =3D=3D WMI_VDEV_TYPE_AP ||
>             arvif->vdev_type =3D=3D WMI_VDEV_TYPE_IBSS) {
> +               reinit_completion(&ar->peer_delete_done);
>                 ret =3D ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
>                                              vif->addr);

So it would probably be cleaner to have a helper such as
__ath10k_peer_delete() that performs both the reinit_completion() and
the ath10k_wmi_peer_delete() call. Avoiding duplication.

>                 if (ret)
>
> --
> 2.34.1
>
