Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163584;
	b=YGCbTFuBc+PZEWv0uoh1uspOLcgPY+mR+HPOWWoA9ylxb2btVaDB5plAd+Ekl2gVGxg7
	 Qj8OdtGWeHqC1sF76t8MQaYN+lVuqAfk6iD30xHRCE7BD9x/jxMmNAkJbXVBZdZLOTro5
	 teXH+7M8NRWdwDoRcdC5MZjcCsJ9FkLjS/yqANnLqeups6w5RUi6+kcnQhPx1GyjBmZpX
	 Otj39YaYhNSC38laJFbGy1oFz1I/0q+1O3IPh4bQEAcj/Sxx8LwN0nPt+MOvuOrx1ypli
	 ME19bq33UkHjTLGaKB7Ok51B382YaR/XxqAzcbPR09/Nq9F1h3yh2oR0eNcSoB6QtKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163584;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
	b=rTuIhTxmonL6Z9TdOMFRaMJGQqvt5oPrhmxuUp2LTJUZJCvRqh8c0CfLES3R7n0S5KIM
	 wHC7bvDchEBLcvVD3//Yo+M8/HB+XwRhA9pSY8uCHMYMBv4+hbyEAPDg7xCymafbD2hMP
	 913yZs+/3J4UekrNCudxgAzM39S5AEvIKPtpw53n97Y8X90lUGYxB4EMGPYtYL8GOIjZl
	 c9y7OSCKTajoFdL5A7g0MsxXY0137WaSL01jg7w4ZXlgXsrbJnAwHbCLq4qMBmyn0u3bZ
	 7s4h92mQM6IGxMC5dTHU6ewvJrOcrobU+1QmM93IAVcJQwxDcDhr77wgOnn6sHSgvbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AkMpuipO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OjDUV1bB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA98606A32A
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA98606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AkMpuipO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OjDUV1bB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fuVw2695637
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=; b=AkMpuipOaXUQtf44
	LKnET7leBzKWmLPkW706dCVmxRawALoP2UOII7YjXnYENh/C/2muz/3xSK7iiubO
	yja2NECnxTbE7LHzKVAWycd4APujSgH6EX+/5oUuHEzX3AKrM7Vl+T/1tE83qdKp
	su9E68arYKGVXgclpypqQAfb814KfdaIEGXdCGVV6m2BltnYz8jUNc17U2twrmjX
	PZUmDnRTbZTnM6EZetbXqpGTcTZkbhy2gIyiUUtJ434I1xpsYXH92uIlFRA2oWe4
	DCRtQZmjYg0ebi/RL0pimpkMXyYhDXUGxvLt/XYbmMfL793SYtq8ny0p6oKGBQQW
	exHIMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au2q54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:33:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f2fafeaso87918385a.2
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 00:33:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163581; cv=none;
        d=google.com; s=arc-20260327;
        b=mUrMvrXrwNv2CLn/qeqRajYgxXDtULgM/4bH72wFYtRKi5g9Xt/w5lNHge6adaLJj6
         SiQ18Vz21n6T9/55fBNJVmcGB64jCVBjhVahjstvxNmC8Mv7RtqmW6APVuFHJ1K00j+3
         HbyzN1Q/yYGpuzw+JqlVGepS73puaRfK8c9Qy9JVI01BitksvIN/nFoBBgczS4V+t5dC
         4BqAHMZzV5NNtewL+BJffLwbjnhKVWqOKd8RBo/91HTitouzKST+MW6vF+9BVnnNqZkR
         1Tnoz289VhPY+pj1PXWIOO0w+Hd9qfLddeOc3mzy8yN46cTwPlMnTzj3iffJ6c6PUQjm
         SvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
        fh=3O3Ep7Cd1DcmHZBP48/2HMGnenQpDz7zQHgRFH4AFZs=;
        b=rL71Bvc55sLU7GlnobsScoe6adA+XlmRM8iDn0bPui3jc7nIli2R07eN6l8EiqyDL5
         nvCM2Jh4opS+4jAz8Ylzo4in5zk8MDoMeLVnx6V8gIu1aoTvR76EFmqa2HvUuJ5o3I9j
         49O4vL7JxaZtxNdxFIVItlzbCUrQlpDjycE5uz6AZCIbxm2O3q2oLZbg8N8G9WmRDRpm
         4DGpQWx7uRlgZvvHvZvwnDQz2b4aQGkcBJdQ8MUshZPUAeWAIpuRbSqxWKXdbJqMM2EO
         JHvQ1DamcyY0SQTmnMFL/2nnT+osQGTeu+6+0/2MeaBmJs07BFxl92tmVebV1Gbd3Lsn
         D1dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163581; x=1795768381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
        b=OjDUV1bBB8I0CX04/zVwdiDQ1C2NDQRiRf8ygTU6O+F8mTbckk61CRwJbBZ0Qlm7Cj
         ntlXbDp/oy2B0GZDA/JMesmMBsWqpIYxZAYKwQCdJ76H6bDVVWkjtwruwCYt1ercwpdJ
         NeX8SZLovxWyaEcRYGJ6CR7OvuY6FOxhHCqz1ajrLAuAIfw6srJ6K9WGH8HASjvwnEmE
         NMunR9dM/X+Wkqm71Z1fFWnuitdIRu4TYVQoEW8L1F0ntwPtMYC6WFNvocIrrWHpyTcx
         h20s4bi0iNveuwa0KGMlT78GYUm/DmrFe3RPPVQUReHX2E35kN2IRUDwf31TsaG8sziD
         +rDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163581; x=1795768381;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
        b=OF0eXdusHAVehS/UYXDZ3/bygw3fdJg6LtGIp4dJHIE07B3g+djHocvB78Z+XLdAtR
         31r/ID1HD5EkpYTN6WEGX44Dwc/E5Ud+Ej7qkOnL0ZL0avUPuGjAlmgXkbGnNDz5Zf9f
         82lN5yfwH4p5jKh2nKeJoRv2hciQ08AmeFZTz+oW2MGULipWW4igUwK7YjAXOrmx+CKx
         Mvm6zXEw9tlEVGNw2951CFXV5fgkbtjlx4WAOlXjr3DAdObL4L94NWRXvjkQfjIsGisk
         5To/rAVtW032+qhALDFslWGrzuVy3TYMljxj3lZtysNhS7lxTWz/Dap1vFG+F9eYvWee
         lnkA==
X-Forwarded-Encrypted: i=1; AL+hErETCcPtxW5bmk2UvnuMCAkG9qwiOsWNoEG3qn49eJzdQI/k2agK4xmyOwrAQI12rPVwAx1Ybloybw7hgizUaQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1rvi6mSOzftyF+nTXSIbc+YmrHkZPfvookpqiNL6veqiwA73G
	Zf0DoVkiC+i/awuwp8DveQPxtMtYi2jQJdIE6LxTEYiGK9KlrjSVJC19I1ZVKjKtEt7gTsYdxJP
	AIV1jT/zXTPMbCS9g3tn+n9FaemmTWTm1LXjjUOOOVw+s8uvrIejPMOHggiccwEUIQ2zAYO1nlb
	HEkTe4dhVl2kkThyW0n1IjwZfFeBMjdGNhNxnpTbCr9snD
X-Gm-Gg: AYBFou3MsSN9ufsjK5MXxFlk2OEwfMddKxoe//Skjl+1kGeGrKDIiiED90JI0qjFPY+
	TJFaba70yTJYIvbgwZ/FQVfVYamaH6CpBz6hluQPBzHUAzUg25psUahYF2ew7z0i4th1Uw2hxaK
	ITW60VeJqDpfU9y9D7qtHUuqM/1lWrEtBIEzH/QKLAkcZmLdHybgVEC8vqGVLDS/Q6dHTdfe2sJ
	Kk2/tb/XbjX2BLCtpRCOkqSVoEXEiCcifD+iYd9QlU4YP5Hf5/vAJbE1e1f+nvIM8wfxtZKwcwZ
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id af79cd13be357-949bda21c95mr163125685a.83.1795163581630;
        Fri, 20 Nov 2026 00:33:01 -0800 (PST)
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id
 af79cd13be357-949bda21c95mr163123085a.83.1795163581044; Fri, 20 Nov 2026
 00:33:01 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com> <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:32:44 +0100
X-Gm-Features: AclHuK9d362EMFPFXhM64AVRYKskGoTlaSxy6WxsQcqESpcHzMJ2h3YDR0lL_Mc
Message-ID: <CAFEp6-3TfPV0iy3O=HKZXPhpDpRLffL0RZZt8n9aVBk-v_HQ8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: qcom: msm8974: Fix WCNSS wifi interrupt
 trigger type
To: arapaille@atlr-engineering.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
        stable@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfXwKSbcdgmgIaQ
 cB5ppc+mwnB/qVIigP/stXWd4IzXSThXszw+z7feY2eOrHbOHi/+5YFVQM4K5EcXJa7ZPhiwMGh
 pr8p5jqYi+1xueTq/cBvFppuguYbbNH3ISHKZbM0OQwwmJw+zWdrAC1IeTI6TgU7dRPGHXJFwUs
 LYApATL7RqcwN5ZlPQOuRILgq1fDmFpt67pNrQmyg13es2l7oO2AA11hgbjy0OgBymSgbbGyRoU
 KCL41oC2onAZL9uZ8mOee+4su7ASBMQtKyua3bas3sgOdIXeaMcLE+1XUDHKiMBkC8wyou6G3nb
 /s8dV0oPWJSuv11iB/C2qe7vPd0gFk9t5aHsQeUfUblcbvt3m8lcGmbUPlHh9okcQ9qUk10bXyN
 pmXwH3fyDj1bDf6gVeh/TsFQ0vAK8MUDsQkLB6L5eqgGU8epOQzb7txXDay4c4pBo8pejfA55mB
 5S6AJpqNPSuXDb+HuVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfXyjp0gFc5JoKs
 ELhQJw8sQqX3M3EyI89dNkkxEbM9rLOLj/RgubNkkrdnftZ97zP4kde34csBESWdqMGgboy/nTf
 WPzh2wKhAdmCNqO6NLcn/48wcDYoP8I=
X-Proofpoint-ORIG-GUID: RHxQqJrQ4RjrnheFNT1-OGlMdj63VFtx
X-Proofpoint-GUID: RHxQqJrQ4RjrnheFNT1-OGlMdj63VFtx
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b0005be cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=idF7ahqy7yQlu2L1qvIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=L2g3GqtBoyQv0ocsUjqh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200033

On Fri, Nov 20, 2026 at 9:05=E2=80=AFAM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> wcn36xx requests tx/rx as IRQF_TRIGGER_HIGH, overriding this edge type, s=
o
> the re-probe after a WCNSS restart fails ("type mismatch, failed to map
> hwirq-177") and wlan0 never returns. Use level high like other WCNSS SoCs=
.
>
> Fixes: c7c0edecfba8 ("ARM: dts: msm8974: Introduce the wcnss remoteproc n=
ode")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8974.dtsi
> index f300de74c4..b9666feb8b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -814,8 +814,8 @@ bluetooth {
>                                         wifi {
>                                                 compatible =3D "qcom,wcns=
s-wlan";
>
> -                                               interrupts =3D <GIC_SPI 1=
45 IRQ_TYPE_EDGE_RISING>,
> -                                                            <GIC_SPI 146=
 IRQ_TYPE_EDGE_RISING>;
> +                                               interrupts =3D <GIC_SPI 1=
45 IRQ_TYPE_LEVEL_HIGH>,
> +                                                            <GIC_SPI 146=
 IRQ_TYPE_LEVEL_HIGH>;
>                                                 interrupt-names =3D "tx",=
 "rx";
>
>                                                 qcom,smem-states =3D <&ap=
ps_smsm 10>, <&apps_smsm 9>;
>
> --
> 2.43.0
>
>
