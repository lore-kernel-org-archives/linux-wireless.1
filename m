Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122713;
	b=O7oDgaiJty77o8pJp///UbJ5JEDuJz2wEPpL0A3zvHXzGZUGWTb8DJpCSff/IJQ2p25L
	 c1qxDaqvByEerDMkxF/jba+UN3dhjXJbHlOQQaqeTv/sr/f9HTd54aToFnbA72Z+m2Xh8
	 pyQDVp7KQaswoI6IWPyTM/79d0Pd5Au8kz6I895JuRNSfeSo1Tp0Ju/3aoqvm7SNULNym
	 wVKwwktR88KuahNz5Cg4VQdSWxd6ADpF594VPPuAZAQwoLC+X+0EoYUiRbF8DOgepE9z0
	 AVOtvCABRcM/7Ky1h64JQFNTx5p5IyxOAc42k85MoM/8/SatNNOL4imCcSBdzE/PiOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122713;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:
	 In-Reply-To:References;
	bh=xwe+ag+p96NPTLKz7iKx34K0hlI1qrqil1yjqdEfUJY=;
	b=mDQtW6JGn6PLn0y2VKY79e+cPiKjJRy8eLkOiKvZeDfFVbCDLWrPCPG6+LlxAQzhfycP
	 fXIisrP+T2HLXMtx+AhAbaJSESqF5iP3Gf/FTJiFLj4fb14YKFB9YlcKLPzKBtPPqoSeP
	 k1y4yKopeU5KCgR/+7IGf4Kr44gThpf366/o+NldgACd85X3yabKcFciOFMb7Dgtn8YyM
	 Ci++oqOr3NFuMWY1D/igZa9jEJuUeRiRPNB01v/CGlLrR/Zi84FFhiBseoscnH7f79NEf
	 Bwj8rv4bL3r+GWEE5a68E3KSDtWlhaH92CWfkVFR6gQypRDB4vPO4drHyyGJY6DjzwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GR6iA9xv;
	arc=none smtp.remote-ip=91.218.175.204
Received: from mta0.migadu.com (out-204.mta0.migadu.com [91.218.175.204])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7022F606A334
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 07:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7022F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GR6iA9xv
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lFZuuyRp8xyJwXS8+XkH6SERH9LQs++3bkdubhuYAaw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794122709; v=1; x=1794727509;
 b=GR6iA9xvN/j49Wjn2/gxyCOxKGNU0/Iir2yngIQ0nCxSBhzrIaHmpN+IFvRW8vFuW+WroZQy
 JbKopFalUJnrsbQbcwdyIIiAwCVw0ktu+mYGBQb1CUMo5LmrUdqHElZigNgJuSwSiT9vVUW1yCo
 uiEWSwSsgXDmhsVYfbjVKaz4=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0e4514053fceecf4;
	Sun, 08 Nov 2026 07:25:08 +0000
X-Mizu-Trace-ID: 0e4514053fceecf4
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 08 Nov 2026 07:25:08 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <bd0f7a6723a11810263d3e35eb41cd9a096f051d@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v3 2/2] wifi: rtw88: check the C2H payload
 length before reading it
To: "Ping-Ke Shih" <pkshih@realtek.com>, "Huihui Huang" <hhhuang@smu.edu.sg>,
 linux-wireless@vger.kernel.org
In-Reply-To: <bdb47a1dc13347448cff24a26a231478@realtek.com>
References: <20261105125958.3891196-1-hhhuang@smu.edu.sg>
 <20261105125958.3891196-3-hhhuang@smu.edu.sg>
 <bdb47a1dc13347448cff24a26a231478@realtek.com>

Hi Ping-Ke,

Just one comment on the struct idea.

November 8, 2026 at 3:56 AM, "Ping-Ke Shih" <pkshih@realtek.com> wrote:

>=20
>=20Huihui Huang <hhhuang@smu.edu.sg> wrote:
>=20
>>
>>=20+    if (rtw_c2h_payload_len(skb) < 3) {
>
> The 3 is because of GET_SCAN_REPORT_RETURN_CODE(). How does people unde=
rstand
> what 3 means?
>
> Maybe, we should define specific struct for status_report, like
>
> struct status_report {
>     u8 id;
>     u8 seq;
>     u8 rsvd[2]
>     u8 retrun_code;
> };
>
> struct status_report *status_report =3D get_c2h_from_skb(skb);
>
> if (rtw_c2h_payload_len(skb) < sizeof(*status_report))

Agreed, a struct is much easier to follow than the bare numbers. One
small thing though. This struct starts at the C2H header, but
rtw_c2h_payload_len() leaves the two header bytes out. So as far as I can
see the check would ask for 5 payload bytes while only 3 are read, and a
valid report with 3 or 4 payload bytes would be treated as too short.

Maybe the struct could cover only the payload, like struct rtw_c2h_ra_rpt
and struct rtw_c2h_adaptivity already do:

        struct rtw_c2h_scan_status_rpt {
                u8 rsvd[2];
                u8 return_code;
        } __packed;

Then it compares with rtw_c2h_payload_len() directly, and the same would
work for the channel switch report and the two TX report formats.

Best regards,
Luka Gejak
