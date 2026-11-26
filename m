Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795708929;
	b=ry/AFhFmlM346/e6lqbKjKzPYFkAM0CiUS655gFL+HUkj5tBJmkz3QnoK2GFOsaFUdHq
	 jJrHLIkFUM9GJHcslawuz0vlssWlyqmYaWERUAkTPz9vtZPUO8kJvajOK/edKxwltgtxC
	 WU8/GwPpgBeqlRDgvgBV+c/HMh9ovU93trvMzeD6EZMq/Qc/01xTsNyUYGauthOr/1RjW
	 AvMwGGATIjSjHl9m3h1TcMYjA4+ETOwP/oA9ZmJUep3OqSnPCSLLtqZtfZbYnlKcFqqbP
	 386lesOWDL1FfeR1CmL/Ibnz/zC639X4R5s8KpjXr8TGWj5X8ttNZWoKvR7oM/4tn9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=;
	b=TZTK+lmfiEqUaBvrMAhDgqf09oN6BnYhortH3RSjTa+E0ETiwSbl08s32Ciqkt08+dal
	 ew7C5wBK9tJQoVNMsi6Hj9mbhAIuCSgpZa3VqdIOqEfBc9QhfCjS/XSJXtagDmAUESmmV
	 yF5z+v4BCPdtFFrx2fYNshGZmGruPyrmAcHQ1xEEiCnkh1AX5MdkcebvY9w/8o7zp0Jil
	 JH5IxmjvRgkNdrwlTZkAN3zirKq14BwhKC/4Ch/bDCdoD1KPLAp3IC2RHLWRiXcmpTB5i
	 sRLIv6oQmb72ybI7VrNi+rh/YMQg03CZgW80CmsSSLxXaOzRyhqVd2GbKUEoD0x6qmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MH+xYPwB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ajVpoeiZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7FF606A321
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B7FF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MH+xYPwB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ajVpoeiZ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuFrx3357351
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=; b=MH+xYPwBCG/SjU3j
	2NdNOS8uSO+nbNsKGh88+fn5vGTMLM1MBqpM/d5H8Rqfx0fp0kcF0+N0rgr7m3Cz
	qrPqiI8kTp0pZkZ4gwkxHjV2zuB0BTU+hdXa1XfrgyBmK3crnI+t82/3Pn3AFjGE
	K2J/Wp2VzT98l2yimS+DNUuJ3xzPn7k4R8lNg3VcniRAxgkPwqSANTf74zXa4dxh
	ibkM1GPOf2/+QQA5irEaIeMi3FVmdd9Pkf1V09pzXsHrjNyWETiUCvNx36C8SMTw
	lhKwhxHy3dWWiPbNTQd7EaOcEo2kefEPt1FDdMEGKiYhYvlaXt6kvgBlRBfQdj4+
	0T5+RA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfbmbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:02:06 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b2fb1f981fso87122217b3.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:02:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795708926; cv=none;
        d=google.com; s=arc-20260327;
        b=hLtzn8XJgzYY9WZ2XKQJoxtXXtnyuPEUxjfwR7jqcIOkkfoFkKmEe9OSUjFoXC5xCF
         7/gOuHN+x+EUiYzc8u2763NUUwB6sakrLB63HYgnasTh8Ugp4vLswNR5pHI3mrUMLNOA
         SotsA+boRDulE3gj7a3DUxHpBlkG772J86Nz8tPWBtPYkM6TSQiCue8mosBcklMsSvc2
         2t2hx2i4wutUXI1CYkhXLxuiQ6ulff45upnRoZRIkSVqcoI5nec9fRJaFuusvt+bIzpg
         cDZTUpAcGO/aaHwy4OjqRkvJVYMBzK3V61e2aVB8LufwhkYF1MuobaYLbPRLtjwoTj0w
         Uggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=;
        fh=bgJXjpAWbQNgueSx9tFGT+8sjF0o6J3IxwY/8EfAMkY=;
        b=ADyRw9/vVDwxF5ChxEHAuLbEjT4yl8hQBagwl7onsLAXD3zhVo5putkCmcccqEuGYT
         6uk0w4gXXK8B974grFT1S3HHN2AGajOYH40cedr9Dp4uH7YjespCym3ghfAMJ5bXyzIi
         ha05pRTpU8V8tjNIUAAm5aLLYnxlrzFfNYNhBtJvYmkj0LLlZzF1uUos6MVrLoBdhoNx
         dc6NjiqXO3hIPLnNTRr7RbjxZJ8ywwkst3b1wf2yU23XpgP9Fpu/cGtozFIntXo0vWl1
         vnYPMeyk+e3wCOXqCC27hZKqlH2PDJ6gl2PLnQU8XDvV/BJ6oIlXpqBI81JAQ7DXZVFv
         Yj8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795708926; x=1796313726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=;
        b=ajVpoeiZU3MS33/KqP0BPvdKRrh9TE/zJEpDjdInuZhlgVGwPkkMx0KKRQAeOcwsjW
         nFf2QKstiUd1R5sxsi9A/v33GU47peZ0cUavdUcvBsaVOpsPiiL6nQU1Gh1/glGwJCWq
         hNd3YJ4rWahyQnvWVNt+TMWZ705sKd1IWosHB9HdNgRjpPboCXTc7wanzKhfiqH2E1M4
         kQTqC2zlgBUbtcJBq8d6o/kGjHxVIIoFgWoZ7MzlGycc60iT8qr4sJdlAsrbhVORrzxz
         lIz7GWbPDi+IkR2mIz+RDKD1to10QEQUSladBozZCM3mhlf+3xaSh6aTlOz/LBgMhPF7
         uUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708926; x=1796313726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=;
        b=Xb0tRn4iLhenz/JVSqRKSGX7ISHMqya0CxorBFVjg7VdBio0h0omPiv33GiVFa//QQ
         Vm+ZjzgV+umwKltkhtyeHtWYHMOYfG7/Ku0GJdbU9zFvibYA6OiV88NaR5e3M+IEbdtG
         3fF7XOpSYl5ipW10yf8Xlgswdr1+8axzUWAnjCQzz5UIdHUZk/zq5o8AcZuC4QHZGP5d
         bu1oh1832LeAhseS2I8lxjwP47WttlWJz4vB8VxvCq//IHaaJWilkEmP71i3aj3I+D/y
         CWQy1+8exFl0aN4bplBkdIsTDjmc8mAfbTJCEah9omsPMBJJtNfGCH+71zQS6c8KU+u7
         bWhQ==
X-Forwarded-Encrypted: i=1; AL+hErHSuOQHAMRYOSs4Op6zEVrH0jeRJKqfWfr722o9dxr2kzfzpDDNHXAJn0hG85FNi1tCWi/Xt7fD/xI6C+zN9Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+1ycGABkfbJCR+4kTy3kGxOLlxh203qTO85OKsT6aqBqGFSyfw
	fuw8olRDMur441ZO3ApR5Dy21HVm99rYG2Kg6HGmS3oawlZv2oCz6bPtGaPEHd5RbH7AOcE7bgs
	7SwrcqN6L7NoxQ52IEpfaEXA8V7Q0sBbSyKx7uoFdwyneRQey+W54VGFwQx8zygo+uShgv2Kfn4
	TsfVdjbjcF/znk6+m4CnRGstmprxF7iE+x56Pa8aX7jI/R
X-Gm-Gg: AZFdTZe+OVdPiU4W2uoZDUjU0Z9OKMO3KlRhrFmUHvBcE/E6VmA5kV80jL4uyi6xAPv
	JesW3EY4jHlbSQ+6ogTflfkC32Y4EvomzjpS+fnzgsTitek1zBvOGIFBIJDQ1RbuJgG5i9jeXqp
	Owpvf/6XFfLlPF5GwlUjrHOA2fr5cQ2N9JSwNH6QEeQFlw/wXKC2OrhDzhNdZ9PpfmKjh9SwM81
	PpfY5Ezvnc55C36rxdheimfw7xi9zdk8QMogpkhST63QYR1yR/IOxtXEYM3SsR70uDQdwkF6Xc7
X-Received: by 2002:a05:690c:7348:b0:8b4:cba5:fd6c with SMTP id 00721157ae682-8b52044065amr97501317b3.22.1795708925904;
        Thu, 26 Nov 2026 08:02:05 -0800 (PST)
X-Received: by 2002:a05:690c:7348:b0:8b4:cba5:fd6c with SMTP id
 00721157ae682-8b52044065amr97500147b3.22.1795708925311; Thu, 26 Nov 2026
 08:02:05 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com> <5e83a95f-72fc-4a5c-877a-9238f76df192@oss.qualcomm.com>
In-Reply-To: <5e83a95f-72fc-4a5c-877a-9238f76df192@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 17:01:54 +0100
X-Gm-Features: Aa3M54ozjhMAAIRiMG-A1E2xZ-DmwTbX9lpZ7R2j6rBAFsZAM3Zkf6dIszSnsmo
Message-ID: <CAFEp6-2b48rEz5ozY8C5YGH_mWJQov1X64S=M=Fv2c+WCWHM=A@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: js7igegrzgEnSj46THLkVo8y9ilPmpR_
X-Proofpoint-GUID: js7igegrzgEnSj46THLkVo8y9ilPmpR_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MiBTYWx0ZWRfXz/qEzoGOPT2w
 VJ4JwfIStFBOC9uTswxTmgg39jgrpHWkZ7kNq25VVvssgYpT/KditbEdBFvDtXr3w5hPUrvmTx4
 pIHYboZ34rTOF4MHSFk8iZ6XiQ2Wt4k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MiBTYWx0ZWRfX86HLYkbo/MOb
 lZw6gVMkm1/a79P2dRF862gXsvD5jl4DlZ9HkcmMYP5ZoRfuVBSh3qhZQaELz2xtddbIFYitQrw
 XQxDxnlO04o6xB5LhybY6wuzQl7uUXDvPDuDRRROoFm7a633cd4cvlBZ9iLs55xWYSV3nZW/I25
 ldFPchC6A+UzM2u4dX3pub6db+1j5SGDejuQMMSR3/hGsoBXmQ1+1pPO+NKsyUCtKScI7jxzvbk
 QdvXP5Fd4ypp12R26l2GZNA6ItZd+V13sK64brpQgb5qumr542Yy71XYwGA7wFZttu4q0V6bsWX
 ST/zDkTHeU9kcuKl+9+91DRXU8jzq0vUaTfBiZb/Rlmka6J+kIEWU2ylmiTrIlTRT/GkfMSsi1V
 cBWnNgRRqygz7F3bJ7/cApVRVnquyO9I1ITVfr8S/VZJRjf4/bjuPFUNIZ8kWtJK6rrPT4TpsZG
 Yf2F24e2B1JTAO3AIew==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b0857fe cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=1cAfef3_83k28a0CgYwA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260062

On Thu, Nov 26, 2026 at 9:16=E2=80=AFAM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 11/20/2026 4:41 PM, Kang Yang wrote:
>
> > @@ -8170,9 +8177,13 @@ static void ath10k_reconfig_complete(struct ieee=
80211_hw *hw,
> >               ar->state =3D ATH10K_STATE_ON;
> >               ieee80211_wake_queues(ar->hw);
> >
> > +             /* Cancel the deadline monitor first so it cannot declare=
 the
> > +              * device wedged after recovery has completed.
> > +              */
> > +             cancel_delayed_work_sync(&ar->recovery_check_work);
>
> If recovery monitor runs between "state =3D ON" and the cancel. It then w=
edges a device that
> has just recovered. The sync cancel only waits for it to finish, after wh=
ich
> pending_recovery is cleared while the state stays WEDGED.
>
> would be better to move cancel_delayed_work_sync() and the pending_recove=
ry reset in front
> of the `ar->state =3D=3D ATH10K_STATE_RESTARTED` check? Then either the m=
onitor has already
> run and the check fails, or it is cancelled and can no longer race with t=
he transition to ON.

Alternatively, disable_delayed_work_sync() could be used, but it needs
to be balanced.

>
> > +
> >               /* Clear recovery state. */
> >               complete(&ar->driver_recovery);
> > -             atomic_set(&ar->fail_cont_count, 0);
> >               atomic_set(&ar->pending_recovery, 0);
> >
> >               if (ar->hw_params.hw_restart_disconnect) {
> >
>
