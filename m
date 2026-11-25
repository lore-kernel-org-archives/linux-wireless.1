Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602398;
	b=Pr2hEd6BbXOtBrwpmSNIlWJ521SIr3AGr3YnniRGQaAlicH0BOaD3bKEvSCT89GcQOUJ
	 SYF01S1GWWlnKIVSR7qQrRH0m4CPHnraz7k8SS6PKVY+ekiNHEjxgYhgnGmTaqJHE205T
	 f3zi0kU8MaQhUiP6N2azB7qNPtUDFN8pljmuNkmZqTJDwBiRSTLmkyslr2m5KoP2MMLKM
	 hM9CtayY82/z7n4mRDBeWqGRRHNmgBwos2TbtGWfoBYipCj2Uc97TdX57EVV1b8wXg6oY
	 plYr8ne6mcE+dcCQEds+7DXBcViRS9gQb3z02I9ht9KX4uNFKRDINMFwNDVbTXQwgdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=;
	b=2pTftYtjTZXO/t0QjPwZivQ3d0L0ic4XRJPjRlcoteCLdAXLbqAK2O+cgtc50cI2FMOT
	 vUkhRA9Q8GYeMz28P/4GYigOSqLfu9NLT2qJ09zLuGwnReEl1su4Hxe9i4LeBK2CanbsX
	 sxJOJUh0liulrqBd+ZO75aj+r8eLaBSv42DTJt61OUXcjECljMkO5zDha7Ft1rriEeBWj
	 4Z/jfaZAA1VQWjW1w2sE7khwHkUC7C/Me9x+yoYPWO7SDdmqP6/YuJGE/JNC8rbMEL3Mk
	 oA2J3YclHB6hsY5w1sdCAmm1nlEEwe63/p3ZWh4YNy9Q0eCYpLhQMHX59oBgexNF8TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMulSzXC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kFaOPrZ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED40B606A327
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 10:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED40B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMulSzXC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kFaOPrZ3
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTH74034188
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 10:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=; b=oMulSzXCiUoJH7kF
	IIZGVo5vdon9UD11anYrJr4YAYEATeTNaNwG1cBsfB41hNrS+cdg6iQ9EB5yrrXL
	zaGIxoIxo8mq4/xbNq+Jde1AskIMPOcDGQpFK1g6r6QwsoE7g8fGDLo8aCo5kPbU
	dXE5gjvVm/38lOxAQzpwksEfWdYGEhGtE4y0l2F5pnabmI74iRaXb+fPUvYZgh88
	MjOx5ynN6TRURPdIgAb9P6Kjxk9ot+/YzSRne3jwIR1xOa4yg7wuKZw/DhOJastg
	/DXtqzpwrG4ghK1qirctUHe+pcAlbaSroMyXqT7dauLAGSOwgj0S3Cg5xKpQp+UF
	3nO9zQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbj9br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 10:26:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so867177385a.1
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 02:26:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795602395; cv=none;
        d=google.com; s=arc-20260327;
        b=mhhrTE4xrCdPMpad67vhyyaENX/MLL/ClmaJJE6jiHdhSucSUoKXsGiTR37qOkBSus
         7jTnnBk2kjeeTVlX5f4kdO1q7IJX7FU3U+GBJPhM+UrxIh+iFfyg8DUhu0ajY6cwlY79
         eMo+zfnFFHMuhqvQYxdLiKbWtikvprYaHeC8bORWl4KJ7QcT0gSCMZLSNCFwIQy99Og3
         5v9pdM2tw1qDj+6gCq+KuBz58QOEKkE1CoICrwnorB5CErOdbpRw7xTEN17X6d/ehyTk
         Gk7vfKdrr7Cv9M9ticvmfV750VbQ09LbRaSPkIcBGlBtFyOeDAf3cMJtTufB/AyELXa6
         bc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=;
        fh=YT94kPx5f5bGjKHFln9lXPOkhl0vQS15Z1maPEtM4zk=;
        b=on4SWJqRPbebknBO4GAL2ebGNvRBTmD1UcgU4UPyElBVpI/33D7OlARbTjaBcwljUp
         GnalcKo2SmuBKSPh4CMl+lf+rj1xxOSR7UptCNjiRNmw2T79ZbPvvL4RBcOnNRjmKG2p
         rqK6wKInPNS/cmkzJdYz5rphfPg7WpIgCOmaVNjWc2FogvsEZNIkMfjdZjmGk7Dgyl0Y
         mGQs/wmXueSkH/wxLyLrXw3+1TJOLDpaTRwYCmU8QQPLv/5a434g0dGR7nY/8La5fu1o
         AER0j0qJAwWKLyQ+DO3ItV9FYIvzg0PRcIj96DuD585AC/PW5jK9rj1RZbJli0jJxXoa
         oBxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602395; x=1796207195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=;
        b=kFaOPrZ326QVGwH7N1vc0v4AFrKvQbWVFuajc2H7Qezhi9kN0z4mmt4fdFSdRlNLKV
         mtNATao9bYNw0hCvloCwAGheqWcDD4CIluE1bPR6yl6e+XMnJ64p/Vph/P71b9XrgOij
         fRzcsfH7ceVQeh0EGPj0yvU88gBx2pwbHYqrNkQLqVefYtDCGQgLbznfsGHR+DYoBjDW
         DAtVpJpABgp610P6H7/sw+yt2vH6/AUNjphYAn3kiZDDcI1L7BLYBWJdMJLmEZ84oWWG
         pWI/JCXmWXevf7154OeU/2Vdr8X60THMnNmDtKdUOUPRLFj/M80t136L7pe7OmAsl8GL
         svpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602395; x=1796207195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=;
        b=vEgilq+SjR/Hn9FTByo+JlVVctf0jR3u6f6aXeocCW34T8RqICrOexj/KPsbj68u9v
         C21alq9WcfIhDhkgqpShLUyWcV97KSBI3al0vf6KfmS+XSETyhoYRL7DTC9OShBRlqTr
         EVvEu9uw1Q3iO+X/zjcDYx5MzvMtrsKCgDefy9+k4GOW4NuP4Fyvz5P0DM44ji+v5Qee
         nzwMjOan1WW2nlSAGdtQdXNMIDqzmK82d5ogKW8o5NkJy5a0umLRr1me2ENVA4uEJPxw
         m6ulad0y1NaYX8But3A3ByHYmujep4lXo7iIcEbaDBs1YIeyN9CZJAjyoy8t++j/pNV+
         hkwQ==
X-Forwarded-Encrypted: i=1; AL+hErHl/9Jnw9jJm3NkAXl8RekBRS1uALD+3S8RIwpqzTnnkSjFr9MCqPbUP7Zb2k2yufL5Gj5z9+SIuU9rMaBs8Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8+gmbfmMXjmJzowXF2PJxpoHZcYZjCmau9rzK7tvYEr30KC83q
	vv2ayzVf8PqBpsmENx2Chi0SzK7zcUSmAntRIv5KpTEz7bttVx3FOyJ/scTspik+aalZBgXqSW5
	pG7TiDkRhKsC3iHh5/MB53O8rLOWHf6OctgUjD2m5XpUvTi1IZUwGgCr2SX8jJP5RzbKQZX9sv7
	3FUhbtp3k2+hJYUo5Vo1XQEvdywF1UkNpvbkKVZw9Zf4B8
X-Gm-Gg: AZFdTZehGIuWy4pnfxv90qcFSsrqtSm1L4MXYmS0ln2TvbN3ebAsYiRXZLMRsAjKl29
	FeME1+WAswCoMnT33QNmMt+ZfAi10nqIO0ON6anlTODcmH+tzj9W0f57pGjTjrJhIhn8HVhAXmO
	axdnvhMhRUou+bc8Br7oj8dwe+773yrhDumLYiDWh8/Kx7Ows9YSGmdCLwJd+DW7IVjvmjLsgD3
	sPsAKifEW9tY0EQMHa/hODsDbbrksURwYG27al8xto+ZNV3sxe30DM+FQ0q9yYkCIY3KLVW+Hk=
X-Received: by 2002:a05:620a:448c:b0:93a:82a:71e5 with SMTP id af79cd13be357-949ba95560bmr2997969885a.19.1795602395012;
        Wed, 25 Nov 2026 02:26:35 -0800 (PST)
X-Received: by 2002:a05:620a:448c:b0:93a:82a:71e5 with SMTP id
 af79cd13be357-949ba95560bmr2997966985a.19.1795602394422; Wed, 25 Nov 2026
 02:26:34 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com> <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:26:22 +0100
X-Gm-Features: Aa3M54pDilQgmdQ_iplbP4xTthogyJeysaRUo2ZcdIbsLLaIHGQCESKKQsu7iDE
Message-ID: <CAFEp6-1UR8eSK+nPeQ+wAHsb50VD8iyrHs2DoyNqtPpKV9mJUQ@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX0zdXF8RVhzH8
 YUBziznVF160dXxnsBxsPadEZPcZgykYLfz2Xx0we7ZSBw/uRxIqboAZNuqaXAAdyH9Y6cNFiss
 wC8NgggDpIBJAz743StlKYYhSteUKaE=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06b7dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=RL1vT02WTRJ250hdzHgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX8rl0Qfc6IjxR
 CAXUt+5mr287D9TVwtS+Rgd6O71j8SL2NFiauAT99kJyaNJ3s2T51GnIqrMRhSSRUlUKU6chy0P
 8nJP6LFq6/qg2vJG5UAa51cKuQ7o2HKPULIXCQTP2I+XKnQR7nbxOpZRP34dW1jR54lruWYSa1I
 wDkxTB6O+w8ehA7y0gcFyWBgKc8a24zTLW2CkRbLSboSywLZcvlNQO5EozZC2zRYE2Ag6NkRYyr
 LUMPpgZJYjyj/dy1ecdVQrLV6lPFJA/AeS5snulxmNCdI6Az+85j2WAmPYyTjE5qjiOEfplPyaq
 zdn7KrxfxUxkyTPVCRVKwQ/udQNnJPFrf93g4i2/KytX6pxN2SCRXEPkU3YYT/dx8YHvAF6Pb++
 vZXT/YKw6YoXE8MaWk6k8oc5FsC2ogQXYfnpMjDc2EqM7In2Eu7KUH8BISpqx32hPPFNOa5ZTI8
 98bn013LadxjQ9VWHfA==
X-Proofpoint-ORIG-GUID: 4zWbqIuMLZVyjuUS0Jz1-zTKC6me6C3q
X-Proofpoint-GUID: 4zWbqIuMLZVyjuUS0Jz1-zTKC6me6C3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041

On Fri, Nov 20, 2026 at 9:42=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.c=
om> wrote:
>
> Each recovery trigger queues recovery_check_work on workqueue_aux. If
> a recovery is already pending, the work blocks for up to 5 seconds
> waiting for it to finish, and marks the device WEDGED after four
> failed waits.
>
> On SDIO, one firmware crash can raise several triggers. workqueue_aux
> also runs SDIO RX and WMI SERVICE_READY handling, so the blocked
> check stalls the traffic the recovery itself is waiting for. Recovery
> then fails with "ctl_resp never came in (-110)", and a recoverable
> crash ends up WEDGED.
>
> Stop waiting on workqueue_aux. Let only the first trigger start a
> recovery, using atomic_cmpxchg() on pending_recovery, and ignore the
> rest. Replace the wait-and-count logic with a single 20 second
> delayed work, the same bound as four 5-second waits. If recovery has
> not completed when it fires, mark the device WEDGED. Since the
> deadline already covers elapsed time, fail_cont_count is no longer
> needed and is removed.
>
> Because pending_recovery is now set only once per recovery, any path
> that abandons a recovery must clear it. Otherwise the next crash is
> ignored: the device is neither restarted nor marked WEDGED. Clear it
> in ath10k_stop(), and in ath10k_core_restart() when the device is OFF
> and there is nothing to restart. The OFF case was found by code
> inspection and has not been reproduced.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new =
work")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/ath10k/core.c | 75 +++++++++++++++++++---------=
------
>  drivers/net/wireless/ath/ath10k/core.h |  7 +---
>  drivers/net/wireless/ath/ath10k/mac.c  | 15 ++++++-
>  3 files changed, 56 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 2aa18adb31cc..b536c21630b1 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2535,48 +2535,45 @@ static int ath10k_init_hw_params(struct ath10k *a=
r)
>
>  static void ath10k_core_recovery_check_work(struct work_struct *work)
>  {
> -       struct ath10k *ar =3D container_of(work, struct ath10k, recovery_=
check_work);
> -       long time_left;
> +       struct ath10k *ar =3D container_of(work, struct ath10k,
> +                                        recovery_check_work.work);
>
> -       /* Sometimes the recovery will fail and then the next all recover=
y fail,
> -        * so avoid infinite recovery.
> -        */
> -       if (atomic_read(&ar->fail_cont_count) >=3D ATH10K_RECOVERY_MAX_FA=
IL_COUNT) {
> -               ath10k_err(ar, "consecutive fail %d times, will shutdown =
driver!",
> -                          atomic_read(&ar->fail_cont_count));
> -               ar->state =3D ATH10K_STATE_WEDGED;
> +       if (ar->state =3D=3D ATH10K_STATE_WEDGED)
>                 return;
> -       }
> -
> -       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar-=
>recovery_count);
> -
> -       if (atomic_read(&ar->pending_recovery)) {
> -               /* Sometimes it happened another recovery work before the=
 previous one
> -                * completed, then the second recovery work will destroy =
the previous
> -                * one, thus below is to avoid that.
> -                */
> -               time_left =3D wait_for_completion_timeout(&ar->driver_rec=
overy,
> -                                                       ATH10K_RECOVERY_T=
IMEOUT_HZ);
> -               if (time_left) {
> -                       ath10k_warn(ar, "previous recovery succeeded, ski=
p this!\n");
> -                       return;
> -               }
>
> -               /* Record the continuous recovery fail count when recover=
y failed. */
> -               atomic_inc(&ar->fail_cont_count);
> -
> -               /* Avoid having multiple recoveries at the same time. */
> +       /*
> +        * Pure deadline monitor: it is armed by
> +        * ath10k_core_start_recovery() and cancelled once recovery
> +        * completes. Bail if there is nothing in flight.
> +        */
> +       if (!atomic_read(&ar->pending_recovery))
>                 return;
> -       }
>
> -       atomic_inc(&ar->pending_recovery);
> -       queue_work(ar->workqueue, &ar->restart_work);
> +       ath10k_err(ar, "recovery did not complete in %u ms, will shutdown=
 driver!\n",
> +                  jiffies_to_msecs(ATH10K_RECOVERY_TIMEOUT_HZ));
> +       ar->state =3D ATH10K_STATE_WEDGED;
>  }
>
>  void ath10k_core_start_recovery(struct ath10k *ar)
>  {
> -       /* Use workqueue_aux to avoid blocking recovery tracking */
> -       queue_work(ar->workqueue_aux, &ar->recovery_check_work);
> +       if (ar->state =3D=3D ATH10K_STATE_WEDGED)
> +               return;
> +
> +       /*
> +        * SDIO raises several triggers within microseconds of one crash;
> +        * only the first winner starts a fresh cycle. Losers do nothing
> +        * while the owner runs recovery.
> +        */
> +       if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) !=3D 0)
> +               return;
> +       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
> +                  ++ar->recovery_count);
> +       /* Arm the monitor before queueing restart_work so that restart_w=
ork
> +        * can cancel it if there turns out to be nothing to restart.
> +        */
> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
> +       queue_work(ar->workqueue, &ar->restart_work);
>  }
>  EXPORT_SYMBOL(ath10k_core_start_recovery);
>
> @@ -2655,6 +2652,13 @@ static void ath10k_core_restart(struct work_struct=
 *work)
>                  * or if the crash happens during FW probing
>                  */
>                 ath10k_warn(ar, "cannot restart a device that hasn't been=
 started\n");
> +               /* Nothing will be restarted, so no recovery is pending a=
ny
> +                * more. Leaving pending_recovery set would block the nex=
t real
> +                * recovery and let the monitor wedge a device that is st=
arted
> +                * later.
> +                */
> +               cancel_delayed_work(&ar->recovery_check_work);
> +               atomic_set(&ar->pending_recovery, 0);
>                 break;
>         case ATH10K_STATE_RESTARTING:
>                 /* hw restart might be requested from multiple places */
> @@ -3769,7 +3773,7 @@ struct ath10k *ath10k_core_create(size_t priv_size,=
 struct device *dev,
>
>         INIT_WORK(&ar->register_work, ath10k_core_register_work);
>         INIT_WORK(&ar->restart_work, ath10k_core_restart);
> -       INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_wo=
rk);
> +       INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_=
check_work);
>         INIT_WORK(&ar->set_coverage_class_work,
>                   ath10k_core_set_coverage_class_work);
>
> @@ -3806,6 +3810,9 @@ EXPORT_SYMBOL(ath10k_core_create);
>
>  void ath10k_core_destroy(struct ath10k *ar)
>  {
> +       cancel_work_sync(&ar->restart_work);
> +       cancel_delayed_work_sync(&ar->recovery_check_work);
> +
>         destroy_workqueue(ar->workqueue);
>
>         destroy_workqueue(ar->workqueue_aux);
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireles=
s/ath/ath10k/core.h
> index dfee432615eb..2e100dd246e2 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -87,8 +87,7 @@
>                                   IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVE=
R)
>  #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
>                                   IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVE=
R)
> -#define ATH10K_RECOVERY_TIMEOUT_HZ                     (5 * HZ)
> -#define ATH10K_RECOVERY_MAX_FAIL_COUNT                 4
> +#define ATH10K_RECOVERY_TIMEOUT_HZ                     (20 * HZ)
>
>  struct ath10k;
>
> @@ -1207,14 +1206,12 @@ struct ath10k {
>
>         struct work_struct register_work;
>         struct work_struct restart_work;
> -       struct work_struct recovery_check_work;
> +       struct delayed_work recovery_check_work;
>         struct work_struct bundle_tx_work;
>         struct work_struct tx_complete_work;
>
>         atomic_t pending_recovery;
>         unsigned int recovery_count;
> -       /* continuous recovery fail count */
> -       atomic_t fail_cont_count;
>
>         /* cycle count is reported twice for each visited channel during =
scan.
>          * access protected by data_lock
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 8e604697d6c2..74aca0af11c8 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5427,7 +5427,14 @@ static void ath10k_stop(struct ieee80211_hw *hw, b=
ool suspend)
>         cancel_work_sync(&ar->set_coverage_class_work);
>         cancel_delayed_work_sync(&ar->scan.timeout);
>         cancel_work_sync(&ar->restart_work);
> -       cancel_work_sync(&ar->recovery_check_work);
> +       cancel_delayed_work_sync(&ar->recovery_check_work);
> +
> +       /* ath10k_stop() can race with an in-flight recovery. Clear the
> +        * recovery state after the works are cancelled so a later
> +        * ath10k_start() can start a fresh cycle instead of being blocke=
d
> +        * by a stale pending_recovery that nothing will clear.
> +        */
> +       atomic_set(&ar->pending_recovery, 0);
>  }
>
>  static int ath10k_config_ps(struct ath10k *ar)
> @@ -8170,9 +8177,13 @@ static void ath10k_reconfig_complete(struct ieee80=
211_hw *hw,
>                 ar->state =3D ATH10K_STATE_ON;
>                 ieee80211_wake_queues(ar->hw);
>
> +               /* Cancel the deadline monitor first so it cannot declare=
 the
> +                * device wedged after recovery has completed.
> +                */
> +               cancel_delayed_work_sync(&ar->recovery_check_work);
> +
>                 /* Clear recovery state. */
>                 complete(&ar->driver_recovery);
> -               atomic_set(&ar->fail_cont_count, 0);
>                 atomic_set(&ar->pending_recovery, 0);
>
>                 if (ar->hw_params.hw_restart_disconnect) {
>
> --
> 2.34.1
>
