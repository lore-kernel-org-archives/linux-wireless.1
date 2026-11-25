Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602606;
	b=knxKSle27sH196cEURU8TlkMU7dJtrKy09EEEI2v36EkeE2x3lMlJayjY7+uHl6UzO9M
	 SWUaXKL8bKsZTDLBy5DpR/TsdBY5G/Cj1JlMb0QHaAGmN3MEcAqtMwZ6w/SOYjmFxjcfb
	 uYPw1okLU7VsSvdouHsX+x6YByJKmlRtyNyRE3fuODFIY3x4IUV5hOdyNgPghCOU582rJ
	 vU7OzVSGgxnYtP9tAu327vp1ig2SqQJQ/c2dQabF+wrJ/ZZtSaJXjKuc9LDvYhajgoj84
	 O48lnVA/5RNZ8MS/NiEJKdMmMJrEDsPV/2BjFP5fZoH43aqYRPUvo2mQgd8L9pOHjJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602606;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=;
	b=30+eCN/HqQJ/w7iJwS9EF1S+wLF3rxyr/iE5khM300mKHjSTQe4M/g2wYGGyltQB4Ee2
	 jnaeUMme/pIZFv4m+jAmAnhwrM7ui+/kN+zIUtKpJnlNNLkJXn8NO9AHr4PNWBGlVhNu+
	 szwwt8rVPrN4gNi7UO38PZdAVN5T/3rolOR7w2QpS0pjuX7yH3+nzUDizEdA/l/v2GjCP
	 9tGeLdX+sIrT53OhhivXAhDftnIdARaK/UBGOU1jsK+fNvzh1/YDETlBfl3j5XcISqsIo
	 xrab0iCxn8ElJfzBwVXLPRyo2GZnXwyyNgViVVk7On4RWfTfmB8ql98i00Im8FM4CCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hS/j3m3N";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="V/5fuywX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63D7606A32D
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 10:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E63D7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hS/j3m3N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V/5fuywX
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9nldW1505274
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 10:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=; b=hS/j3m3NMdqSZNmn
	H/9F7AGBxeactUtknaWoOn92yBBi0bRfu+zo2N02aqxQRGFtbrErVNK7sFs2mV4+
	2oFBBTsKdaIVXaP+W8rYALcSTxg3wt+8+8gkcjFY43TFPhMS/k90svZG0YMOUTs+
	hv63zRTnzGFYKrM5z/EqI4jXPPvZyRTgpovS958JcOWnMBL9I+zXaomNrZX/DgMi
	VqBTIi8ctPeWKMEHRlP51MgTW1eeCh+O/4rQVfRtkCug/gwOc5N7axw+p02AgJ2s
	S6OfBzov599DVY55CVtxXrX9D+CP0yGmgsLz7nJotvFEFPfDsLqCgHCMOheK4BLB
	/Ie4jg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa29rby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 10:30:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53639e47be2so107595361cf.3
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 02:30:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795602603; cv=none;
        d=google.com; s=arc-20260327;
        b=haCHap66dwqwmMuQYwUe0Qh0Jrjr93il96MhAWu4kfPDRTtmFQSg955HpnAmZIXZ5J
         Gk72diZvPgQqzhVEsN+l8oypnQ6+U+UNeFItTXMTEfeovS6xjJmAO3TtrGkZdeWnDWSI
         kpb8rUoFIaXyxYEcSupftfwXEhQqrvC30zV3hvviA2UVZIxTfdSp44i4XU7WJEcammhZ
         YbqcdbfA/kY+i6CXNCkEgdJdaP1zZPXurjq2cWSESntIhkdyiEzhP/lnyRojtutvsWGt
         ww1OL1+dASNV6LXALCXuGYieTDBw1WaJ1e8PgjrQUQ6NHu6zv4cawlzmm3EPM+tVjpY5
         Z6Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=;
        fh=JXpN7wIQGYQft7NZAhrjMkq1bE+ukLUKvRzvAY7TYgI=;
        b=s3T/xoU+5BrJJAZ+PmNWo/dcMYxPZG6DrMlnhBMB/zB7YkQKKYhC++1Tpn0WzZQjHr
         kew1oKfYnNwCNCoryOsQfRQ97Z7wmEn47KzVMheUpDnwHVmYTSE+aPLEe993HAUmp7Dw
         cUI1wvqPrG2gcyTs4ftowc8WKpvnW669xXIgQuu/kSieDtsbAYSyr1ccY2yhX+8lRTME
         yrKQkd/IhuDFHgWLq28TD1ObMl6qD0FSc//zFR/Ad7HHEpIOXF4pkyGPjnoeW/PnwMQC
         E7+NQX8TEG08NxONO+SNQ6xfDyaAZ9IWhplNc+5qCgNFtD6TtTkGTwgA6s6NupRoeitb
         BYBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602603; x=1796207403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=;
        b=V/5fuywXAKfgqmXbCPaGXPqNhzD4J65tVXWNvnevDqPzWczNaigwocUhzgXNN+TPkn
         XEokL8wiS3O67NyolQao+qAivCt25z3nRCspQdcokDdH5+drjisCnBBrKSiRg0aoqpXr
         UzEpXqZiBVcaxwQAJqdkuwJEzgN/4d/8dg8pjLEd92g/1XpAAm/vkzKVE4e/W35Pk8CR
         j2Tw5zhBkPv4mb0MBb8EHmPvWNij+h7JGM+eh6lC8i+3xTBZdYFqFQf8FOs+lQErMa8B
         BAyM8GntMyU3N/r4KwsCu1OeY8ccODr6V6gsflbrEilp/DYzcKXHskpLSnZflRij7B6f
         2zKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602603; x=1796207403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=;
        b=089ILtzRhd6p3QxjomCUnQKFklp65w2qqu7gqMgpn+B9tWnuBmKfh/o/1fDgOeRUlj
         xf7IeMvIF7jJtE5tFplLUg/+iZRYeGWAH7PTOdWVKHiJM8MPq9G4hx/MevMNU8mky+sX
         l+1tJJacYZh5K6Fs+vAcvYlTQy9GarvQkHI5T07HpW4zEk/UMrp05pjTgsr+zaMbF579
         KhsB9pAmuwu+anYxYI3gaDMn4CGBQgIAZjXabd9VF3a7Y0QuqVi/TZ7FbDXvNUn6MkdX
         U2UZWi48uU6xIhp3Fh9EEObXGlGENfgiu1QYfIHTjDvZb6ehjW2EXaf4XSzH5p5NDw3C
         kXAw==
X-Forwarded-Encrypted: i=1; AL+hErEaoaq3rFrqn7zm0FuMZwjAq2fCUeaAevb6dMGzhz2NVtqUmDTw99VF3bZv86r4XUM6cWgdLAum48CMAos2AA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+T75CTi98/+odqkDTt5xJgWgZqdW5iJKqyWRqfF4cnd98X3Z9T
	EKJt24tNSbY6kGXK6TA3QGxPi6nCYbRIH/+f4FcCe0bqybOKzkgT/29RX+/ZbuhABHBqJ8xXK8e
	QNNHCyzDWzWvq8IXcglrAxvXdrKQa1mVhVbFi1DoixykcdHXjL+1jANkNQV4GhkWxwXcBcrLbBl
	rit2cRCUxUvpeQE+Rkm6/2YjSDxepiFvSDZUSVgYzmt4m2
X-Gm-Gg: AZFdTZd0zD7Th/xponAp1fd+RBVcOu6NdNNngWcK3SGMSz5ZHyn4Wu3ZO+RHxIZxCDJ
	1KJNuXVSypIKazwJZ7T2Ntf0GznVICd2BQBW9xcGthMZdwVrelWidCVj+wI8Na/+/RtOSsNOP4y
	y65Vb6+bBdmp1arWTY//K8M43qc3r8W0icc+rGw2Sc3O/HyrUc927j1NSZI+c09MnBRaN5H15xv
	6L8Gj+sZv3FFlu+sg3xne4b4xY8rURdXZ/Zl6NIllQ9cUBYWayohX69QHxSzJPxqxYHQyGiAqA=
X-Received: by 2002:a05:620a:130f:b0:93f:365b:42bc with SMTP id af79cd13be357-949ba9dade9mr2961757685a.52.1795602603550;
        Wed, 25 Nov 2026 02:30:03 -0800 (PST)
X-Received: by 2002:a05:620a:130f:b0:93f:365b:42bc with SMTP id
 af79cd13be357-949ba9dade9mr2961753785a.52.1795602602972; Wed, 25 Nov 2026
 02:30:02 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com> <20261120-recovery-v4-v4-3-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-3-53d6a04490e0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:29:50 +0100
X-Gm-Features: Aa3M54pGufnYI-QRJO7Cvakq8nMpzAuX6uVfz_ev6QiRakiuPxsV2Dp10hW8EKw
Message-ID: <CAFEp6-2pecH+PxiDv+VpCfUyQabGSDWitHPbxpAv57fWTiP=mA@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 03/10] wifi: ath10k: wake blocked waiters when
 entering WEDGED state
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: VMtzyhebqVatlVTRvX9CN9VB8bncyB0O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX7F/qmugFgdVl
 kdRa/YoZRIYehVZXfp0Fy7+W+w5XbpwLJ1Kle4om7SL27WVWiOA/wvktLjNbv5k7Nr3nKIfkNsj
 ZLtddzFFJCtFG8ykm/LJGgPYabw0zao=
X-Proofpoint-GUID: VMtzyhebqVatlVTRvX9CN9VB8bncyB0O
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06b8ac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=a4m5kgtdxY4tjFFkCegA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX1t0b9FTcSi/v
 FCCnAPMcizyMsDBp5s3hXIu38B832T/xfv5ZFYgLmeaP+CRjDcfsbfmuL6rGNkSqwF7HJQ32LmU
 7krUr5TP705yCfzjzc+aRC/Ajk9IxvFJHxK1FA1boaV44EME2wYmHvY2OFbG37bCakbIDldqZ9O
 4N3Ak35jawIpDEIyZ0cWsbDy7dazFcs3Z9GxsO+0B6I7Om9iQ1RVYnLTx7lyOtd3SV9BHvh+Kib
 9oI0yjW4MWhLbZlQmUV5zYcmwarFfy4w7lBqgL04Xs8nst5qONxe29vZjYBMV+axjDuR47+TQ2Z
 G1cD7sHCMqWXc9d2fNoF/Hrv3EZ+bghOX0jXMhuy6r+lVyYhkTzEcgYDHORVb87TpCR2XQ9QNKI
 49c0a2m2HWkTQT8yoMSWSysNaI4ERNrR7pEyr+uQ1co8muhs1hYFG4dAC1md/cW+CqREIpP3k3f
 2cOY2ZddKuoD9V+uhgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041

On Fri, Nov 20, 2026 at 9:42=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.c=
om> wrote:
>
> Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
> hardware is unreliable") added a fail-count based transition
> to ATH10K_STATE_WEDGED after repeated recovery failures.
>
> When recovery starts, ath10k_core_restart() sets
> ATH10K_FLAG_CRASH_FLUSH and wakes waiters already blocked at
> the time the failure is detected. However, additional waits
> may be created later while the recovery attempt is still in
> progress.
>
> If recovery ultimately fails and the device transitions to
> ATH10K_STATE_WEDGED, those later waiters continue sleeping
> until their individual timeouts expire even though no further
> progress is possible.
>
> On suspend/resume, these extra wait timeouts consume watchdog
> budget. Crash logs show cases where one or two such timeouts
> are enough to cause the suspend watchdog to fire before the
> driver finishes shutting down.
>
> Apply the same CRASH_FLUSH, queue-stop and waiter wakeup
> handling when entering ATH10K_STATE_WEDGED so blocked callers
> fail immediately once the driver gives up.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unre=
liable")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 43 +++++++++++++++++++++++-----=
------
>  1 file changed, 29 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index b536c21630b1..3bb4d2742c30 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2533,6 +2533,32 @@ static int ath10k_init_hw_params(struct ath10k *ar=
)
>         return 0;
>  }
>
> +static void ath10k_core_wake_all_waiters(struct ath10k *ar)
> +{
> +       complete(&ar->scan.started);
> +       complete(&ar->scan.completed);
> +       complete(&ar->scan.on_channel);
> +       complete(&ar->offchan_tx_completed);
> +       complete(&ar->install_key_done);
> +       complete(&ar->vdev_setup_done);
> +       complete(&ar->vdev_delete_done);
> +       complete(&ar->thermal.wmi_sync);
> +       complete(&ar->bss_survey_done);
> +       wake_up(&ar->htt.empty_tx_wq);
> +       wake_up(&ar->wmi.tx_credits_wq);
> +       wake_up(&ar->peer_mapping_wq);
> +}
> +
> +static void ath10k_core_enter_wedged(struct ath10k *ar)
> +{
> +       ar->state =3D ATH10K_STATE_WEDGED;
> +
> +       set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
> +
> +       ieee80211_stop_queues(ar->hw);
> +       ath10k_core_wake_all_waiters(ar);
> +}
> +
>  static void ath10k_core_recovery_check_work(struct work_struct *work)
>  {
>         struct ath10k *ar =3D container_of(work, struct ath10k,
> @@ -2551,7 +2577,7 @@ static void ath10k_core_recovery_check_work(struct =
work_struct *work)
>
>         ath10k_err(ar, "recovery did not complete in %u ms, will shutdown=
 driver!\n",
>                    jiffies_to_msecs(ATH10K_RECOVERY_TIMEOUT_HZ));
> -       ar->state =3D ATH10K_STATE_WEDGED;
> +       ath10k_core_enter_wedged(ar);
>  }
>
>  void ath10k_core_start_recovery(struct ath10k *ar)
> @@ -2618,18 +2644,7 @@ static void ath10k_core_restart(struct work_struct=
 *work)
>
>         ieee80211_stop_queues(ar->hw);
>         ath10k_drain_tx(ar);
> -       complete(&ar->scan.started);
> -       complete(&ar->scan.completed);
> -       complete(&ar->scan.on_channel);
> -       complete(&ar->offchan_tx_completed);
> -       complete(&ar->install_key_done);
> -       complete(&ar->vdev_setup_done);
> -       complete(&ar->vdev_delete_done);
> -       complete(&ar->thermal.wmi_sync);
> -       complete(&ar->bss_survey_done);
> -       wake_up(&ar->htt.empty_tx_wq);
> -       wake_up(&ar->wmi.tx_credits_wq);
> -       wake_up(&ar->peer_mapping_wq);
> +       ath10k_core_wake_all_waiters(ar);
>
>         /* TODO: We can have one instance of cancelling coverage_class_wo=
rk by
>          * moving it to ath10k_halt(), so that both stop() and restart() =
would
> @@ -2664,7 +2679,7 @@ static void ath10k_core_restart(struct work_struct =
*work)
>                 /* hw restart might be requested from multiple places */
>                 break;
>         case ATH10K_STATE_RESTARTED:
> -               ar->state =3D ATH10K_STATE_WEDGED;
> +               ath10k_core_enter_wedged(ar);

ath10k_core_enter_wedged call ieee80211_stop_queues(), which is also
called earlier in this function, is it expected and harmless?

>                 fallthrough;
>         case ATH10K_STATE_WEDGED:
>                 ath10k_warn(ar, "device is wedged, will not restart\n");
>
> --
> 2.34.1
>
