Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163627;
	b=mXMHFv8qpR1f+nLgit2Q/Soq16/DyV3WxCKImYLOqvR/2gAethkVQhDU+33NVUUkribl
	 1sgvKa2gY5wLdfetCKvUhqAHBxEhvEOUiAaCZLVP0HgVWszETIXECe8bGXKGNpIV3l4i9
	 uGx//ZuqrYlsjFo7zaEc19eWws443Wy6NHsnwEvynFIVm2Q9sRJwYUtaUnf3m60odZJk1
	 Nb6+8pn5KWBGDxVcyC8pggDGZHfwSYspo7HLxDhkZ3aCPntYUdAoWMEu/OesR5E90Owy/
	 qtCA/r+qYtCVX7SLoH8IF/55UpqDYPKDBo9QquXJZNMGf1gCxhMP3BFi1py4yBCyR+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163627;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
	b=QvhUWIBmHrEeqHPvlVgQ8CaeYKhZZwUvBUkKQfobBhwzceHJgoG+zJpoWkKLV18C+WG6
	 NGWghL4ajc2+4tUnM8YMtqtjlcWlWocDoTUf08dHP6QtOi0wE2fubwUYWEC+VhUFMQqxL
	 rgkA8bTW/vmq5XT2YRDnLJsNiR8XlkrJJNcjNtxaI98CAKizmSIL6vTcjKzNipLCMkLUc
	 4Jau5B11pb+oeYAcIxOFTKmTOUyNbwERhHHa/HfcbxsyqRPr5dXC98VV0J4hhyXe0ANx0
	 BZ7o6HXxsc8WKCPyMOx6zVLGNy7DlKioS0Yhv0FJrmeFddfh6Luq5Z3dfp79w7WbpEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JISZ+Ax8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M3ZHQgzu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A607606A334
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A607606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JISZ+Ax8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M3ZHQgzu
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f1od606035
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=; b=JISZ+Ax8oTuX7jaO
	v0PaB+7NbZiya6gB5uQvYINZN5FssYtBKhpEbi0BUM9KPoluq5jgWfvN9SIHp+jq
	7fLnoanD4NNLCVslmdodnWDRhq8cB6IjYHkr5B/b3cnYTcpDCRkQwK+e1PonF9Cy
	WoatW7ZS25rbBhhZzh4GY/83XpnQVcFuEIPzyQvirMZPPqh5ldxOnm32ozzP2RB/
	AFxh6t8XfrTjAxPUjy/LLN9bsvq+zVXWDphJUSaos9EQyz4VHdNQmbaz23+uMz7V
	Wch5mHjM890nPFuLdko7cg/hrKF2AIRYD+WPPBCW2WxnTgaUGRzCPPC4mH3kREAN
	4SL74A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrkwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:33:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so183040185a.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 00:33:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163624; cv=none;
        d=google.com; s=arc-20260327;
        b=msaqwyWHZ7bJF/XgKU7d9asCUcRpENPUrhNLzCNvNqCXHi1SXaiW7em5CXHqboXDE7
         dM/FO2zjeyEG9E/dh3ug1lcf8zaLkzWIXRwzjuY337y/QqYb7N8MW5czoQZ1DFT+IMWZ
         CrrXiusY+5HqdpEbTBIn3AT2k/tGyLZJmeRG0KjU9vrlI50rers3VTqygQKsAepY8IGU
         a4w0SugtN03TI98OLl5Osa2NZmgC3vR8wSSMVzCdivpnDdkYm/nXF+1tXxdZz1wLJCM6
         zogaKKdZLwaXvUkhl096WSJ5FPbAbgdNYp0+IIUS4GQyWvp4h0fAmnTgqoXQoZzOOWtx
         yf8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
        fh=MXjGucT0wvutlPygefRvxHjOadrc/S6YD/u29bliJbA=;
        b=ZKpNJvBlb/sj11cPxtfCiBSjLmvyb5xVAmypevv4lxSZcNF48MutyX/25djVIxETJy
         0+FxbsKy4+8iXH6CXYTPu/KRmDCVzVdFfhsPs4srD8meLtyLgo6Xt1P0QYQhIFwYlAJT
         mnmpyyXgFC8Sgt9KAu5QBrksywHS8LGFw6sskNTnr59sTPteXBUFs24VrLbs9MHT0Ivg
         rzlvS/JIjvsks7fzi6X9b8EsIwTytOXqLPF7vugFj4tgBSsnHefeKksVPgXFLy60PfB6
         bqp+2FkodnvqsNfTmCCTkirdtO/0X7Oc899eat+pvk4+rQYiCfTKKNEPzAthH6Fh2Nl8
         EhPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163624; x=1795768424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
        b=M3ZHQgzujRMWIHTKPVbFJmTfDHRJfZvi+BVqLtasy9xzVgPMdTGmflTim46GNAlZ5D
         SZG3pXNzhKsMt3i9Ft9W7Ok4HhcgTD1MjEK8HwBCOq+iMCYdPaKyp68RCckh68+/dqdR
         +RHYzCJlYBUoW7q1sF0HX7JrMNXWNQOd3Zlaebx833I1ZxMQjwiAyj5UZdjIy3Muk6Em
         bYAHQ35SJldSf0tspS2qMtP2AQ33RABWPWv3x8H7vGBxFNM8YAMHfFWi1bq3Qb7rUTkK
         ft2SDTvkhAvQugCdS03wNKz99MYWAwXjQaIe/db6t9xxW+WxDFr5ysbtqF34RTseuyqn
         N6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163624; x=1795768424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
        b=E/4wRQLp7cIZpozXCB1xR5BKhonITEdMTfR1rWb7heMKp3x52QeEy5Ba7NQKfk0rHz
         wwH+yJg3tfaE5HQkKMeNsd4IrNg0ncphJlvyjtCIQbP72Wt8S3UPO0HFI3UzQl8RNVoY
         H8z5yh2jG/G+8lGoGOCMx2tCk4+tn/cXAvVIud5IPVr+hzjG+euS/GROdhR5sUocTABo
         wkmXGCKrSYLvDoga0mfUEtJBzvQWkIadh/qZiMY7GGubJ29KJ/iP5VxxiAOiiZhCM7Py
         MzUbTukJaeiGTCkoCXjdvYM764821faCPR4NrxpJ9egNtKT/TUVedib8hGHIrRHn9t4r
         u/Jw==
X-Forwarded-Encrypted: i=1; AL+hErFFcDaamjPxbbt0uPEQ7+nP5c4IkVHGpWyeDQX0BoNaVvBfhtpgi7LHsX7yOS3A/b5qM3wMq9lGn9TWvnlLNg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZwSIvjG7gz2YtzP/Ri4+I65bEXYrRgAFfE8ii7vWQPeWfc2T9
	q/1Oozd3tOes8K7OTr04/w5NRIGaZ70m3lZ+Zq6t5dBy839GnZre139rZ5O7JaG399EIZBf2171
	XrlUESk07Jy3FcDCecAHQ0XhQCRF2i8l/2dc0QqSk6aw44cKoT6FPWDmojQnWDpCq8R/hl2H6us
	938TDUOCnxFaREp8uZ21GxKJlKa7PJSnd3BZR+HpEnYocv
X-Gm-Gg: AYBFou2l3jFWJ7thiHjQjwyZb1twrc2qR7CtW40bTYLqzRH1dDdKl8eGmEq43JdWrXk
	iVw4KVVlZqHSMsYgw40e8ayeW0zZ4HpoVSYuWvM+L861BDNJMoicfZqWqsX4mUniT4U61vaMlah
	uVrhmHFj8uMRG5cYE42NSanmNF3rm8H56UemnSq3Vr7MaRhYQr5+4UjbAiCBbQx8r9QAmJ9WtZr
	ZOuciOR9vT45fuyQ5XY8l60D7RrZba3XKOhHmuqnvxbpRqUXfUizMwAy673ZLENaCCUumrF8wNu
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id af79cd13be357-949ba9c31bbmr378077185a.30.1795163624183;
        Fri, 20 Nov 2026 00:33:44 -0800 (PST)
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id
 af79cd13be357-949ba9c31bbmr378072885a.30.1795163623658; Fri, 20 Nov 2026
 00:33:43 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com> <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:33:27 +0100
X-Gm-Features: AclHuK_13YVfgPHe00rWHz3MmtX2ZPWjOWt7HTHyfWW_D-cw5T1GuCsPWKT8z54
Message-ID: <CAFEp6-2wAR7SSMP68g25px2-5NA9ppRoWP-R1RtBALnDGi_6Sw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
To: arapaille@atlr-engineering.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfXyYQ80R3Qak9p
 0/LU7aVsGxdfydxn+c8oZkTT3lT9Su2wzsFYnqsRe0JWMjl9ES/xq8lqZuZv42u0jXTxClWLc0p
 tP1f6jk0nfa3I7yJQoq0o4Ro47qD/tv7sMW4f4bOU+uap4TOae/JuDs/kI9zfUCclIUD2CDZM+v
 nTAwpG8ta+BEuHbtfiV7ClZhzx/+zyPvxv9qQ4vaaCkPdaJElzoqxycRBqS06J4vUdPJ9zGbFGG
 24izzbHe+ZN6heT8xwC2T178L02o+rYP/BQkTexDxdlIX9ZQ2wd6iszCMnwV1kPg5Iso0rlrsbN
 l3WEn1mVte1AL+kWLGIqEC3X8XQnJw0wzhTmE4tdYuPZH0WuiTEeCMnxmulaLEg587jymuVKBg0
 xszz9i58IpwdTT/g/LPKkepZkri0MiNw+MgI3HX0jreDtIeJqslzcI3T4U4Fb++hAg+jnl3mkAc
 yRCav/ZHn6/EQXJwjhw==
X-Proofpoint-GUID: uuHIkQU93-flywf3-lgS9YZRj3kLA9ez
X-Proofpoint-ORIG-GUID: uuHIkQU93-flywf3-lgS9YZRj3kLA9ez
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX2a+AIeVwU+LL
 xFmUZ0Q91FSNDKefRyUlH6rLiSadTSpVMQNvVkfm+aiOP3tR6VyzyTXooWgzNlqvYhjDCQGUf9V
 weOhdWwrI1pqMLam9QK1vwaJOJYM91I=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0005e9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8 a=EUspDBNiAAAA:8
 a=laIMyccDeTmSpVvBuxYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200033

On Fri, Nov 20, 2026 at 9:05=E2=80=AFAM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> request_irq() with IRQF_TRIGGER_HIGH stores level on the IRQ mapping,
> which outlives the driver, so a DT with another type gets "type
> mismatch" and -ENXIO on the next probe. Rely on the DT as ath10k does;
> every in-tree qcom,wcnss-wlan node is level high (msm8974 since the
> previous patch).
>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/wcn36xx/dxe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireles=
s/ath/wcn36xx/dxe.c
> index 801f1218ef..7852f71368 100644
> --- a/drivers/net/wireless/ath/wcn36xx/dxe.c
> +++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
> @@ -552,14 +552,14 @@ static int wcn36xx_dxe_request_irqs(struct wcn36xx =
*wcn)
>  {
>         int ret;
>
> -       ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete,
> -                         IRQF_TRIGGER_HIGH, "wcn36xx_tx", wcn);
> +       ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete, 0,
> +                         "wcn36xx_tx", wcn);
>         if (ret) {
>                 wcn36xx_err("failed to alloc tx irq\n");
>                 goto out_err;
>         }
>
> -       ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, IRQF_TRIGG=
ER_HIGH,
> +       ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, 0,
>                           "wcn36xx_rx", wcn);
>         if (ret) {
>                 wcn36xx_err("failed to alloc rx irq\n");
>
> --
> 2.43.0
>
>
