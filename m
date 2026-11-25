Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795624944;
	b=LpaWffkV+Sn/yxNOB1I0rkGJIJfsLCmrfKnrhYmyGN3h25V5y7Ua6pFswuXTn8tTXAaM
	 Doz3tmNZ8q2S3AB5vGLIiCu1oX1x5uqYishYXod+s+rkjLvPZrpG5w0piYkhI+obZn0jp
	 dmh3Ca5RQjbtBLDw6yiKru9oTKOeTGBxSNtTS4FqI3y1n6NTa0uN98rRfa1gnorCRM8oY
	 eHTv25FABVRvCjGdxcIYQTG5JjMVP5dAjadxKoudA50v0GfkPMZZT+s/tRAVz0FG5zvqz
	 ZmBORLNdUMKcv4vg+OOAT5b2GHiFkN0Jqd/SKDjXrvaTgSD+4l1uuTCBcm1uDTwjxEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=;
	b=4kGF656L7XY14vDq+PSv4L3Cbg86HY07oha4F5ZsKpnJEtBraPdtYZ1KcbO4KHTfLX0p
	 izW/NiXQ59Zs8mrGW657ikCNeX31tbJI2cQC0TG8gfOjN/GSAT2dWCf/CjmgVGU8zTbrQ
	 eAcUCPI1ljOQ/twpIofTDPkkZjZQmo78DL9Ea1B41r5xkfjJ/IKY4DaBLbBvC3VUDzusW
	 aT54SaXPojhtZTVGdtmHD9ohy7Z0bu3StLtPsUZtsT58XFsJ0cnUAySBaRlzkpbiBfGwO
	 yvf55HY6QOWbFxJFMBlyljKfVduFIpeehuHKFW3rPwEGhuKwUqhrg7AKxYwXqDsLI/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=drMVhEpn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=doUBacFS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2552606A681
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 16:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2552606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=drMVhEpn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=doUBacFS
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ7c41670811
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 16:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=; b=drMVhEpnFwL8Gqkt
	7RKt53KLEyUkxcy60KNEQMpNgg9PXPsPJmE+lCJOHR9pHU05qKyqn1BijgW9VeAe
	DEiNi0noA6y75xlwZTowj6AvFG1z9s9ikgpz0hxeGKCbMmNq1yUQk6goDRqgNA+1
	J7S/jq5n/g6+FsHKSjpumJ6F5Zdz3yicYlT/52g9fXagqW/HgVbTxKREJLRx9Oe7
	mnAx4egl/1KuLs72YqoaVts0ImHwr7IZSexY77XGi3vuUpU6JJjhtZiODlai9t2q
	XkmP0SnUO57L36mNnEPN5jAI/vIxCpG2f5v4vvlI8TgHDQIMAbE0jKV5sFLFEtdC
	tzzlyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62var50f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 16:42:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495af07676so941260785a.2
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 08:42:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795624942; cv=none;
        d=google.com; s=arc-20260327;
        b=hbE0IIf1ASbtGzOZiguCzV9EffAxB2vPKCfRdwE275C3AkDZgiIuYbnotIlEJXO1L+
         cWYhzL4+Z0YPnfK5uFew2bYl/og5Z+Ztgk1ghg8wviHN68TvLjZ/UVCgT8BrNz7Xo4h6
         R3tonHhw4PKn81V1F/5/bmcwr9TJnbOzMhocf/DBRLpcYcZKVdLpqsEdTO2bIJ8k7t10
         yejV+/A/DaL27A+SzE4rjTk/fghcdEsqJBX+oSD85v3qslzPKKh8qQpwlcMJADau1dxE
         SJSPfBlkDBi8uLXhGIPDp/TbvhaqqC6wg+79smwo4Nf7L4GP5mqqaccXt15neS15EeIV
         ld0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=;
        fh=+hejQQBufXO4HxjV6GyUni6TNeiUkZRSTW9dZ0EtG54=;
        b=BY1A08BhXgCG89qzTmy7gakX77Hq9DBQdoBFfZBblRyAqjVCa40VYuA2eL1BzdVmlZ
         osS1WOWzBIdz13x49vIaKaSOH2dbwuyHQBzSu49UF64JE02lszT0TuXpk3eA1Dec+KZk
         eQrC8S3GKJE6Jsm4GrCPbDUCNhKirt/feNPU+Sn35rHX5Sx9DIF7MuhqLIHcTZ4qN4X9
         qAeCrdEI0XxLN7P4JRPNLab0/AgnuwenOdNBsBYXUoNHAmO0llOvzKgSE9xji0ptDERB
         iCvjH4jDqgUv/X37ACTcdg3WyWvQj7hnRLUDvAyOwps26mpuNHC4lzJUbR1FbK9c61tx
         2PiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795624942; x=1796229742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=;
        b=doUBacFSO3fHM9jm2mASyqKgxVBnSEdrleIXWx6gUzeGbHZP8hymE/gZE8e9eyq0Bc
         WJB+btPKKFwlzTb+ul7G+6dNWnXZ6WU9wV/tnpCSdqP+KNZs8ACmYU+dcdRlkWMTAjrC
         wGFaFP79ZcyAc0F2GTWFqkGcy0aLj4MurMXl7F+AsKmm93OmfBvIB5++vCoMW685Hkwq
         VgqvHTYJSwOjyZh6QYz1z5aQX66mRXirOrq3jX6vpK275dgqMql1f7LwpGDqPgw0e8KJ
         3s5ej+Ej/G05nBB9ryWghli1OLRpgDXQTEDIPKjTDWFAYbjx6LC5znEPymRMebEcV8+d
         5WeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624942; x=1796229742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=;
        b=Q/tL8M8dwobjig1gRlJL3gKYDMXOfzJLX1HsIRdlfEsSKXDFFTQ86ltjDxPESBC2i/
         VqKQc6mEvoE3arCtTJXBjoIVMoawbOYuBW/A4Mmfu9czUBvngIWR00elc3W+0VwaX4CD
         9Wmn8HkFGYrNUzrPByXSxm0gr7wWqFpNpuJK9PHR0xjHx4u6FeIpOGkGhc9rmQjqFHHw
         +YIRcLg/XhgVSnFJegOhkU/a8BzTIH2YzK4srK5450t2JVXd0ka46qDwBeh7DCA4qM+0
         or49bR8/KGuLt/cpIzgiazo7+WO8ncAowsxjgGsMkR/GZbystkOOrFN2s+UpKGE+oi5h
         LBsw==
X-Forwarded-Encrypted: i=1; AL+hErF754jpb4CHTg7g//u2EABVFOUMSBKcrEWhf55sq7N/0i1Jj2SymrxamXM9IgvwcU2szcsAek8SaDbZkFsySg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9V67R3hDy1NJx6j8MxJNijgxDaF8BMn/6rxd4UBSCu7hhcnydT
	JIjCgP1Np6DGdUj914qXVBX7Y3AbHH5YeyROz2SG1YruhrEpg35iB0Ht0JpHGn2OaNfabRIZlhq
	PVmj9yNeSmxzEuGHHTHLNDXevfNoBVkqAbYJ13HDP6mgIym4q34PInR/w1Jjwj7waMfLENxbTVJ
	ae3Ie7BZgpaIxcRruYzPBSqA1uQSOa8xi9UsyjBoH1tEwzTT3ymvgEEc+dSA==
X-Gm-Gg: AZFdTZcSS4OwuRZIBFMYy6SpugHXsfnMpEme9c64M1xhdX3rKTqfoCDmJm3+UQyn8hA
	ugIpRabX5TDkRisZeQTgw6aHGPEhIZMrNUTdvAkU5Tfeo2Mn/KFJK/4sZavao8x970Ewo/zd6vT
	edqPtGgZNcqWFF+PKKQ4fCno9CoETxKFdjQ+Hl6M+BX/JqbzRB45SGRADl3QLldqCtHiX3ac9Gk
	bRe6RwhEVTIaOxZvMQC414H33kznunXyBLAJECNbnG5qSqXhEVxZgM+iKXqO8zB/WjtSVqS0+w=
X-Received: by 2002:a05:620a:4408:b0:945:d852:1618 with SMTP id af79cd13be357-949bab14280mr3203109585a.70.1795624942133;
        Wed, 25 Nov 2026 08:42:22 -0800 (PST)
X-Received: by 2002:a05:620a:4408:b0:945:d852:1618 with SMTP id
 af79cd13be357-949bab14280mr3203103285a.70.1795624941624; Wed, 25 Nov 2026
 08:42:21 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121194939.3647400-1-morf3089@gmail.com> <20261121194939.3647400-2-morf3089@gmail.com>
In-Reply-To: <20261121194939.3647400-2-morf3089@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:42:10 +0100
X-Gm-Features: Aa3M54pON6Dg34vZZDiCdbMrAyUpRK1E1I1B8NNIa1Qr3eqV_CLiVHxkBaMNstA
Message-ID: <CAFEp6-3cQBaC1Ob1B8v8ZmQcMd_KfyABXxV81M9u0RkBY=Z0Ng@mail.gmail.com>
Subject: Re: [PATCH 1/3] wifi: ath10k: add firmware feature bit to skip
 channel stats events
To: Gianluca Boiano <morf3089@gmail.com>
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2NiBTYWx0ZWRfX5yeeOpGyUNVT
 FsJ+NeSskhhhrm2E4pVrbP+eb/iTTvL6I7Iju6cnTCy24RXKvAPVYN6qSLwWhpmF+Y0/ddAXIiR
 /G8bjNjY0QbZ0ggU33Qre15MUh+K+OA=
X-Proofpoint-ORIG-GUID: jQtlyGD0gVw0aUtDFJOfGvWAYr3l5Bba
X-Proofpoint-GUID: jQtlyGD0gVw0aUtDFJOfGvWAYr3l5Bba
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b070fef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8 a=Wc1NDcPGuWUPlOtgj-wA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2NiBTYWx0ZWRfX7BkuFePrj4wP
 +UTttGJ0VoV/fo47pDqGd8aSGaHfdCQhKp4jSkRsT47yruPTLRqeaFzwNLkui4riagpeiylTU/8
 gx8XMV6F98G9LPOvfI4QzTu8zFQpTROA/eOU0JRY7JiZsPrCJYI58rWpl1znKUnvy/+OD6QRxwq
 JKbGVLygEi4yQooDo7PzVm5hgZyL5L+YnmJC5T7l8p+K/ucp+k2Vkvde1z1Ujq1qVEeIfqrgfpk
 JsTr9zRK+m3FcbCrB+riKsw23Vt3IwMZRFFvH2Saf7V3zAnnlgqeAURdyAt0Exng1KX4Ww1dfxQ
 j/Kna/nCNj3xLYrMVxg0cPkrKQ/1M69kJunUH7p3K7A85i+K9nJUP+IBTGrwgz8NhHh5wfces7N
 TiMXmcaoIzpNSkS6lmuKZs9lQIuUZRwTtmvfL3xAZ8uLrmgXLwHrT+EeTKAE9C9D4ysWRM8r4Gn
 cTVvWFvVKQvc4ohDUmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250066

Hi Gianluca,

On Sat, Nov 21, 2026 at 8:50=E2=80=AFPM Gianluca Boiano <morf3089@gmail.com=
> wrote:
>
> SDM660 WCN3990 firmware crashes during scan when the scan command
> requests channel stats events (WMI_SCAN_CHAN_STAT_EVENT):
>
>   qcom-q6v5-mss 4080000.remoteproc: fatal error received:
>     err_qdi.c:459:EX:wlan_process:1:WLAN RT:2073:PC=3Db00a5d88
>
> qcacld-3.0 only sets this flag when gEnableSNRMonitoring=3D1, which
> defaults to 0 and is not set by the vendor WCNSS_qcom_cfg.ini, so the
> vendor driver never exercises this path.
>
> Add ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT so affected firmware images
> can opt out via firmware-N.bin. With the bit set the firmware no longer
> reports per-channel statistics during scan, so survey data is not
> updated on these devices.

Are we handling or using the CHAN_STAT_EVENT data in the driver? If
so, which event handler or function currently consumes it?

Regards,
Loic

>
> Tested on SDM660 (WCN3990).
>
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 1 +
>  drivers/net/wireless/ath/ath10k/core.h | 3 +++
>  drivers/net/wireless/ath/ath10k/wmi.c  | 4 +++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 2aa18adb3..d37add4cf 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -815,6 +815,7 @@ static const char *const ath10k_core_fw_feature_str[]=
 =3D {
>         [ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL] =3D "single-chan=
-info-per-channel",
>         [ATH10K_FW_FEATURE_PEER_FIXED_RATE] =3D "peer-fixed-rate",
>         [ATH10K_FW_FEATURE_IRAM_RECOVERY] =3D "iram-recovery",
> +       [ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT] =3D "no-chan-stat-event",
>  };
>
>  static unsigned int ath10k_core_get_fw_feature_str(char *buf,
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireles=
s/ath/ath10k/core.h
> index dfee43261..29a4c0d74 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -838,6 +838,9 @@ enum ath10k_fw_features {
>         /* Firmware support IRAM recovery */
>         ATH10K_FW_FEATURE_IRAM_RECOVERY =3D 22,
>
> +       /* Firmware crashes when asked for channel stats events during sc=
an. */
> +       ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT =3D 23,
> +
>         /* keep last */
>         ATH10K_FW_FEATURE_COUNT,
>  };
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless=
/ath/ath10k/wmi.c
> index e57588c19..adaf3c80f 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -7095,7 +7095,9 @@ void ath10k_wmi_start_scan_init(struct ath10k *ar,
>                 | WMI_SCAN_EVENT_FOREIGN_CHANNEL
>                 | WMI_SCAN_EVENT_FOREIGN_CHANNEL_EXIT
>                 | WMI_SCAN_EVENT_DEQUEUED;
> -       arg->scan_ctrl_flags |=3D WMI_SCAN_CHAN_STAT_EVENT;
> +       if (!test_bit(ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT,
> +                     ar->running_fw->fw_file.fw_features))
> +               arg->scan_ctrl_flags |=3D WMI_SCAN_CHAN_STAT_EVENT;
>         arg->n_bssids =3D 1;
>         arg->bssids[0].bssid =3D "\xFF\xFF\xFF\xFF\xFF\xFF";
>  }
> --
> 2.56.1
>
